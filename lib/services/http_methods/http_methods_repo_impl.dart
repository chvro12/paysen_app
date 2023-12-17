import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../components/index.dart';
import '../../config/app_logger.dart';
import '../../config/app_routes.dart';
import '../http_baseurl.dart';
import '../shared_pref_service.dart';
import 'http_methods_repo.dart';

class HttpMethodsReoImpl implements HttpMethodsRepo {

  final String _authority = HttpBaseUrl.domainName;

  @override
  Future create(String path, Map<String, String> body, {Map<String, String>? queryParameter}) async {
    AppLogger.d('path: /api/$path, body: $body, queryParameter: $queryParameter', className: 'HttpMethodsReoImpl', methodName: 'create');
    final response = await http.post(Uri.https(_authority, '/api/$path', queryParameter), 
    headers: await apisHeaders,
    body: body);

    return _responseBody(response);
  }

  @override
  Future<bool> delete(String path, {Map<String, String>? queryParameter, Map<String, String>? body}) async {
    // final response = await http.delete(Uri.https(_authority, '/api/$path', queryParameter), 
    // headers: apisHeaders,
    // body: body);

    return true;
  }

  @override
  Future fetch(String path, {Map<String, String>? queryParameter, bool withDecodedResponse = true}) async {
    AppLogger.d('path: /api/$path, queryParameter: $queryParameter', className: 'HttpMethodsReoImpl', methodName: 'fetch');
    final response = await http.get(Uri.https(_authority, '/api/$path', queryParameter), 
    headers: await apisHeaders);

    if (withDecodedResponse) {
      return _responseBody(response);
    }
    return response;
  }

  @override
  Future update(String path, {Map<String, String>? body, Map<String, String>? queryParameter}) async {
    AppLogger.d('path: /api/$path, body: $body, queryParameter: $queryParameter', className: 'HttpMethodsReoImpl', methodName: 'update');
    final response = await http.put(Uri.https(_authority, '/api/$path', queryParameter), 
    headers: await apisHeaders,
    body: body);

    return _responseBody(response);
  }
  
  @override
  Future partialUpdate(String path, {Map<String, String>? body, Map<String, String>? queryParameter}) async {
    AppLogger.d('path: /api/$path, body: $body, queryParameter: $queryParameter', className: 'HttpMethodsReoImpl', methodName: 'partialUpdate');
    final response = await http.patch(Uri.https(_authority, '/api/$path', queryParameter), 
    headers: await apisHeaders,
    body: body);

    return _responseBody(response);
  }

  dynamic _responseBody(http.Response response) {
    AppLogger.d('response.body: ${response.body}, response.statusCode: ${response.statusCode}');
    String endpointFailTitle = '';
    VoidCallback? onUnauthorizeUser;

    switch(response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        final responseData = jsonDecode(response.body);
        return responseData;
      
      case HttpStatus.badRequest:
        endpointFailTitle = 'Bad Request';
      case HttpStatus.unauthorized:
        endpointFailTitle = 'Unauthorized';
        onUnauthorizeUser = () async {
          SharedPrefService.clearSharedPrefs();
          Get.back();
          Get.offAllNamed(AppRoutes.loginRoute);
        };
      case HttpStatus.forbidden:
        endpointFailTitle = 'Forbidden';
      case HttpStatus.notFound:
        endpointFailTitle = 'Not Found';
      case HttpStatus.tooManyRequests:
        endpointFailTitle = 'Too Many Requests';
      default:
        endpointFailTitle = response.statusCode.toString();
        break;  
    }
    final responseData = jsonDecode(response.body);
    Get.dialog(EndpointReqFailDialog(
      description: responseData['error'],
      title: endpointFailTitle,
      onBtnPressed: onUnauthorizeUser,
    ));
  }
  
  @override
  Future fileUploading(Uri uri, Map<String, String> body, List<File> files, List<String> fieldName) async {
    final request = http.MultipartRequest('POST', uri);
    request.headers.addAll(await apisHeaders);

    request.fields.addEntries(body.entries);
    if (files.length > 1) {
      
      for (int i = 0; i < files.length; i++) {
        request.files.add(await http.MultipartFile.fromPath(fieldName[i], files[i].path));
      }

    } else if (files.length == 1) {
      request.files.add(await http.MultipartFile.fromPath(fieldName.first, files.first.path));
    }

    final response = await request.send();
    var responseBytes = await response.stream.toBytes();
    var httpResponse = http.Response(utf8.decode(responseBytes), response.statusCode, headers: response.headers);

    AppLogger.d('path: $uri, body: $body', className: 'HttpMethodsReoImpl', methodName: 'fileUploading');
    return _responseBody(httpResponse);
  }
  
  @override
  Future<Map<String, String>> get apisHeaders async {
    Map<String, String> headers = {};
    headers.addEntries({ HttpHeaders.acceptHeader: 'application/json' }.entries);

    final userModels = await SharedPrefService.userAuthentication;
    if (userModels != null) {
      headers.addEntries({ HttpHeaders.authorizationHeader : 'Bearer ${userModels.apiToken}'}.entries);
    }
    AppLogger.d('headers: $headers');
    return headers;
  }
}
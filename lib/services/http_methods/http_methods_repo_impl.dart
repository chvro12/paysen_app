import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:paysen/config/app_logger.dart';
import 'package:paysen/services/http_baseurl.dart';
import 'package:paysen/services/http_methods/http_methods_repo.dart';

import '../../components/index.dart';

class HttpMethodsReoImpl implements HttpMethodsRepo {

  final String _authority = HttpBaseUrl.domainName;

  @override
  Future create(String path, Map<String, String> body, {Map<String, String>? queryParameter}) async {
    AppLogger.d('path: /api/$path, body: $body, queryParameter: $queryParameter', className: 'HttpMethodsReoImpl', methodName: 'create');
    final response = await http.post(Uri.https(_authority, '/api/$path', queryParameter), 
    headers: apisHeaders,
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
  Future fetch(String path, {Map<String, String>? queryParameter}) async {
    AppLogger.d('path: /api/$path, queryParameter: $queryParameter', className: 'HttpMethodsReoImpl', methodName: 'fetch');
    final response = await http.get(Uri.https(_authority, '/api/$path', queryParameter), 
    headers: apisHeaders);

    return _responseBody(response);
  }

  @override
  Future update(String path, {Map<String, String>? body, Map<String, String>? queryParameter}) async {
    AppLogger.d('path: /api/$path, body: $body, queryParameter: $queryParameter', className: 'HttpMethodsReoImpl', methodName: 'update');
    final response = await http.put(Uri.https(_authority, '/api/$path', queryParameter), 
    headers: apisHeaders,
    body: body);

    return _responseBody(response);
  }
  
  @override
  Map<String, String> get apisHeaders {
    Map<String, String> headers = {};
    
    headers.addEntries({ HttpHeaders.acceptHeader: 'application/json' }.entries);

    return headers;
  }
  
  @override
  Future partialUpdate(String path, {Map<String, String>? body, Map<String, String>? queryParameter}) async {
    AppLogger.d('path: /api/$path, body: $body, queryParameter: $queryParameter', className: 'HttpMethodsReoImpl', methodName: 'partialUpdate');
    final response = await http.patch(Uri.https(_authority, '/api/$path', queryParameter), 
    headers: apisHeaders,
    body: body);

    return _responseBody(response);
  }

  dynamic _responseBody(http.Response response) {
    AppLogger.d('response.body: ${response.body}, response.statusCode: ${response.statusCode}');
    String endpointFailTitle = '';

    switch(response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        final responseData = jsonDecode(response.body);
        return responseData;
      
      case HttpStatus.badRequest:
        endpointFailTitle = 'Bad Request';
      case HttpStatus.unauthorized:
        endpointFailTitle = 'Unauthorized';
      case HttpStatus.forbidden:
        endpointFailTitle = 'Forbidden';
      case HttpStatus.notFound:
        endpointFailTitle = 'Not Found';
      case HttpStatus.tooManyRequests:
        endpointFailTitle = 'Too Many Requests';
      default:
        endpointFailTitle = response.statusCode.toString();
        Get.dialog(EndpointReqFailDialog(
          description: response.body,
          title: endpointFailTitle,
        ));
        break;        
    }
  }
}
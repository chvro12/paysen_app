import 'dart:io';

abstract class HttpMethodsRepo {
  Future fetch(String path, {Map<String, String>? queryParameter});
  Future create(String path, Map<String, String> body, {Map<String, String>? queryParameter});
  Future update(String path, {Map<String, String>? body, Map<String, String>? queryParameter});
  Future<bool> delete(String path, {Map<String, String>? queryParameter, Map<String, String>? body});
  Future partialUpdate(String path, {Map<String, String>? body, Map<String, String>? queryParameter});
  Future fileUploading(Uri uri, Map<String, String> body, List<File> files, List<String> fieldName);

  Future<Map<String, String>> get apisHeaders;

  
}
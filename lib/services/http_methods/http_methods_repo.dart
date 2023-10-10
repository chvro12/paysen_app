import 'dart:io';

abstract class HttpMethodsRepo {
  Future fetch(String path, {Map<String, String>? queryParameter});
  Future create(String path, Map<String, String> body, {Map<String, String>? queryParameter});
  Future update(String path, {Map<String, String>? body, Map<String, String>? queryParameter});
  Future<bool> delete(String path, {Map<String, String>? queryParameter, Map<String, String>? body});
  Future partialUpdate(String path, {Map<String, String>? body, Map<String, String>? queryParameter});
  Future fileUploading(Uri uri, Map<String, dynamic> body, List<File> files);

  Map<String, String> get apisHeaders;
}
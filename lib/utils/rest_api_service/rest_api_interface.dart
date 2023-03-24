import 'package:dio/dio.dart';

abstract class RestApiInterface {
  /// Handle HTTP GET Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Params(Optional).
  Future<Response> get(
    String pathUrl, {
    Map<String, String> headers,
    Map<String, dynamic> body,
    String overrideBaseUrl,
    int sendTimeout,
    int receiveTimeout,
  });

  /// Handle HTTP POST Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Body IN (Optional).
  Future<Response> post(String pathUrl,
      {Map<String, String> headers,
      Map<String, dynamic> body,
      Map<String, dynamic> queryParameters,
      String overrideBaseUrl});

  /// Handle HTTP PUT Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Body (Optional).
  Future<Response> put(String pathUrl,
      {Map<String, String> headers,
      Map<String, dynamic> body,
      Map<String, dynamic> queryParameters,
      String overrideBaseUrl});

  /// Handle HTTP PUT Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Body (Optional).
  Future<Response> patch(String pathUrl,
      {Map<String, String> headers,
      Map<String, dynamic> body,
      Map<String, dynamic> queryParameters,
      String overrideBaseUrl});

  /// Handle HTTP DELETE Request with custom headers
  ///
  /// [pathUrl] => BaseUrl + Endpoints.
  /// [headers] => Custom Headers (Optional).
  /// [body]  => Custom Body (Optional).
  Future<Response> delete(String pathUrl,
      {Map<String, String> headers,
      Map<String, dynamic> body,
      Map<String, dynamic> queryParameters,
      String overrideBaseUrl});
}

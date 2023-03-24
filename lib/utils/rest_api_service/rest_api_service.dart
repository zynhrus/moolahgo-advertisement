import 'package:moolahgo/const/api_error_model.dart';
import 'package:moolahgo/const/error_codes.dart';
import 'package:moolahgo/main.import.dart';
import 'package:moolahgo/main.library.dart';

import 'rest_api_interface.dart';

/// Class that handle access and process to Restful API
@LazySingleton(as: RestApiInterface)
class RestApiService implements RestApiInterface {
  // Setup Dio configurations
  final Dio dio;

  const RestApiService({this.dio});

  @override
  Future<Response> get(
    String pathUrl, {
    Map<String, String> headers,
    Map<String, dynamic> body,
    String overrideBaseUrl,
    int sendTimeout,
    int receiveTimeout,
  }) async {
    try {
      String _pathUrl =
          overrideBaseUrl != null ? (overrideBaseUrl + pathUrl) : pathUrl;
      final response = await dio.get(_pathUrl,
          queryParameters: body,
          options: Options(
              headers: headers,
              sendTimeout: sendTimeout,
              receiveTimeout: receiveTimeout));
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> post(String pathUrl,
      {Map<String, String> headers,
      Map<String, dynamic> body,
      Map<String, dynamic> queryParameters,
      String overrideBaseUrl}) async {
    try {
      String _pathUrl =
          overrideBaseUrl != null ? (overrideBaseUrl + pathUrl) : pathUrl;

      final response = await dio.post(_pathUrl,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));

      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> delete(String pathUrl,
      {Map<String, String> headers,
      Map<String, dynamic> body,
      Map<String, dynamic> queryParameters,
      String overrideBaseUrl}) async {
    try {
      String _pathUrl =
          overrideBaseUrl != null ? (overrideBaseUrl + pathUrl) : pathUrl;
      final response = await dio.delete(_pathUrl,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> put(String pathUrl,
      {Map<String, String> headers,
      Map<String, dynamic> body,
      Map<String, dynamic> queryParameters,
      String overrideBaseUrl}) async {
    try {
      String _pathUrl =
          overrideBaseUrl != null ? (overrideBaseUrl + pathUrl) : pathUrl;
      final response = await dio.put(_pathUrl,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> patch(String pathUrl,
      {Map<String, String> headers,
      Map<String, dynamic> body,
      Map<String, dynamic> queryParameters,
      String overrideBaseUrl}) async {
    try {
      String _pathUrl =
          overrideBaseUrl != null ? (overrideBaseUrl + pathUrl) : pathUrl;
      final response = await dio.patch(_pathUrl,
          data: body,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } on DioError catch (e) {
      throw _handleError(e);
    }
  }

  /// Process request to get statusCode from Rest API Response
  /// or else throw Error
  Response _handleResponse(Response response) {
    final int statusCode = response.statusCode;
    if (statusCode == 200 ||
        statusCode == 304 ||
        statusCode == 201 ||
        statusCode == 202) {
      return response;
    } else if (((response.data as Map<String, dynamic>)["error_code"]
            as String) !=
        null) {
      throw ApiErrorModel.fromJson(response.data as Map<String, dynamic>);
    } else if (statusCode == 401) {
      throw BackendErrors.forbidden;
    } else {
      final resData = response.data as Map<String, dynamic>;
      throw BackendErrors.unknown.copyWith(
          statusCode: statusCode, message: resData["message"] as String);
    }
  }

  /// Process output from Expected Expetion in Catch(e,s)
  ApiErrorModel _handleError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT ||
        e.type == DioErrorType.RECEIVE_TIMEOUT ||
        e.type == DioErrorType.SEND_TIMEOUT) {
      return FrontendErrors.apiConnectionTimeout;
    }
    return BackendErrors.unknown
        .copyWith(statusCode: e.response.statusCode, message: e.message);
  }
}

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:moolahgo/utils/rest_api_service/auth_interceptor.dart';
import 'package:moolahgo/config/injection/injection_core.dart';

final moolahGoUrl =
    "https://51eea27e-6354-4d21-bfba-cf995372ce4e.mock.pstmn.io";

/// Class to define required instances and configurations
@module
abstract class RestApiClientModule {
  // You can register named preemptive types like follows
  @Named("BaseUrl")
  String get baseUrl => moolahGoUrl;

  // url here will be injected
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(
        baseUrl: url,
        followRedirects: false,
        // will not throw errors when status is not 200
        validateStatus: (status) => status < 502 && status != 401,
      ));
}

class RestApiClient {
  Future<void> addRequiredInterceptor(
      {Dio dioInstance, AuthInterceptor authInterceptorInstance}) async {
    final Dio dio = dioInstance ?? getIt.get<Dio>();

    dio.options = dio.options.merge(baseUrl: moolahGoUrl);

    dio.interceptors.addAll([
      logInterceptor(),
      authInterceptorInstance ?? getIt.get<AuthInterceptor>(),
    ]);
  }

  LogInterceptor logInterceptor() {
    return LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) {
          log(obj.toString());
        });
  }
}

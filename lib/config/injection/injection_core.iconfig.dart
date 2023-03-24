// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:moolahgo/utils/rest_api_service/auth_interceptor.dart';
import 'package:moolahgo/utils/rest_api_service/rest_api_client.dart';
import 'package:dio/dio.dart';
import 'package:moolahgo/utils/rest_api_service/rest_api_service.dart';
import 'package:moolahgo/utils/rest_api_service/rest_api_interface.dart';
import 'package:moolahgo/modules/home/repositories/user_repository.dart';
import 'package:moolahgo/modules/home/repositories/user_repository_interface.dart';
import 'package:moolahgo/modules/home/repositories/advertisement_repository.dart';
import 'package:moolahgo/modules/home/repositories/advertisement_repository_interface.dart';
import 'package:moolahgo/modules/login/repositories/login_repository.dart';
import 'package:moolahgo/modules/login/repositories/login_repository_interface.dart';
import 'package:moolahgo/modules/home/cubit/user_cubit/user_cubit.dart';
import 'package:moolahgo/modules/home/cubit/advertisement_cubit/advertisement_cubit.dart';
import 'package:moolahgo/modules/login/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final restApiClientModule = _$RestApiClientModule();
  g.registerFactory<AuthInterceptor>(() => AuthInterceptor());
  g.registerFactory<String>(() => restApiClientModule.baseUrl,
      instanceName: 'BaseUrl');
  g.registerLazySingleton<Dio>(
      () => restApiClientModule.dio(g<String>(instanceName: 'BaseUrl')));
  g.registerLazySingleton<RestApiInterface>(
      () => RestApiService(dio: g<Dio>()));
  g.registerFactory<UserRepositoryInterface>(
      () => UserRepository(restApiService: g<RestApiInterface>()));
  g.registerFactory<AdvertisementRepositoryInterface>(
      () => AdvertisementRepository(restApiService: g<RestApiInterface>()));
  g.registerFactory<LoginRepositoryInterface>(
      () => LoginRepository(restApiService: g<RestApiInterface>()));
  g.registerFactory<UserCubit>(
      () => UserCubit(userRepository: g<UserRepositoryInterface>()));
  g.registerFactory<AdvertisementCubit>(() => AdvertisementCubit(
      advertisementRepository: g<AdvertisementRepositoryInterface>()));
  g.registerFactory<LoginCubit>(
      () => LoginCubit(loginRepository: g<LoginRepositoryInterface>()));
}

class _$RestApiClientModule extends RestApiClientModule {}

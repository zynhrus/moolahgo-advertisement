import 'package:flutter/material.dart';

import 'config/injection/injection_core.dart';
import 'utils/rest_api_service/rest_api_client.dart';

///Setup All Services configuration for the first time
Future setupConfiguration() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await setupRestApiClient();
}

Future<void> setupRestApiClient() {
  final RestApiClient restApiClient = RestApiClient();
  return restApiClient.addRequiredInterceptor();
}

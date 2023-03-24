import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_core.iconfig.dart';

final getIt = GetIt.instance;

@injectableInit
Future configureDependencies() async {
  $initGetIt(getIt);
}
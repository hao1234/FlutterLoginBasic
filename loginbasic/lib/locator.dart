import 'package:get_it/get_it.dart';
import 'package:loginbasic/core/services/api.dart';
import 'package:loginbasic/core/services/authentication_service.dart';
import 'package:loginbasic/core/viewmodels/home_model.dart';

import 'core/viewmodels/login_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => AuthenticatonService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => HomeModel());
}


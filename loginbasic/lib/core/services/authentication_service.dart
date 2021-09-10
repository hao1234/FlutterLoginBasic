import 'dart:async';

import 'package:loginbasic/core/models/user.dart';
import 'package:loginbasic/core/services/api.dart';
import 'package:loginbasic/locator.dart';

class AuthenticatonService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userIdText) async {
    var fetchUser = await _api.getUserProfile(userIdText);
    var hasUser = fetchUser != null;
    if (hasUser) {
      userController.add(fetchUser);
    }
    return hasUser;
  }
}
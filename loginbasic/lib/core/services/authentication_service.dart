import 'package:loginbasic/core/services/api.dart';
import 'package:loginbasic/locator.dart';

class AuthenticatonService {
  Api _api = locator<Api>();

  Future<bool> login(int userIdText) async {
    var fetchUser = await _api.getUserProfile(userIdText);
    var hasUser = fetchUser != null;
    return hasUser;
  }
}
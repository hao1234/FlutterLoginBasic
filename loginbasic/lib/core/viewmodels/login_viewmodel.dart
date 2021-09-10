import 'package:loginbasic/core/enums/enums_define.dart';
import 'package:loginbasic/core/services/authentication_service.dart';
import 'package:loginbasic/locator.dart';

import 'base_model.dart';



class LoginModel extends BaseModel {
  final AuthenticatonService _authenticatonService = locator<AuthenticatonService>();
  String? errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    var userId = int.tryParse(userIdText);
    if (userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }
    var success = await _authenticatonService.login(userId);
    setState(ViewState.Idle);
    return success;
  }
}
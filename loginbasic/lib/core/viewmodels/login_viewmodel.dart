import 'package:flutter/foundation.dart';
import 'package:loginbasic/core/services/authentication_service.dart';
import 'package:loginbasic/locator.dart';

enum ViewState { Idle, Busy }

class LoginModel extends ChangeNotifier {
  final AuthenticatonService _authenticatonService = locator<AuthenticatonService>();

  ViewState _viewState = ViewState.Idle;
  ViewState get state => _viewState;

  void setState(ViewState state) {
    _viewState = state;
    notifyListeners();
  }

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);
    var userId = int.tryParse(userIdText);
    if (userId == null) {
      return false;
    }
    var success = await _authenticatonService.login(userId);
    setState(ViewState.Idle);
    return success;
  }
}
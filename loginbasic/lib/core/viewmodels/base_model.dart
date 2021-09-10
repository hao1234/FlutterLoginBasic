import 'package:flutter/cupertino.dart';
import 'package:loginbasic/core/enums/enums_define.dart';

class BaseModel extends ChangeNotifier {
  ViewState _viewState = ViewState.Idle;
  ViewState get state => _viewState;

  void setState(ViewState state) {
    _viewState = state;
    notifyListeners();
  }
}
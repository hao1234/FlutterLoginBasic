import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:loginbasic/ui/views/home_view.dart';
import 'package:loginbasic/ui/views/login_view.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name ?? '') {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}
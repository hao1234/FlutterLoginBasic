import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:loginbasic/core/models/post.dart';
import 'package:loginbasic/ui/views/home_view.dart';
import 'package:loginbasic/ui/views/login_view.dart';
import 'package:loginbasic/ui/views/post_view.dart';

class RouterApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name ?? '') {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/post':
        final post = settings.arguments as Post?;
        return MaterialPageRoute(builder: (_) => PostDetail(post));
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}
import 'package:flutter/material.dart';
import 'package:loginbasic/locator.dart';
import 'package:loginbasic/ui/router.dart';
import 'package:loginbasic/ui/views/login_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/login',
      onGenerateRoute: RouterApp.generateRoute,
    );
  }
}
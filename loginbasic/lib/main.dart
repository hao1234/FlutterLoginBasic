import 'package:flutter/material.dart';
import 'package:loginbasic/core/models/user.dart';
import 'package:loginbasic/core/services/authentication_service.dart';
import 'package:loginbasic/locator.dart';
import 'package:loginbasic/ui/router.dart';
import 'package:loginbasic/ui/views/login_view.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (_) => locator<AuthenticatonService>().userController.stream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/login',
        onGenerateRoute: RouterApp.generateRoute,
      ),
    );
  }
}
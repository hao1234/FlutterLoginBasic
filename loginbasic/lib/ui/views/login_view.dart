import 'package:flutter/material.dart';
import 'package:loginbasic/core/viewmodels/login_viewmodel.dart';
import 'package:loginbasic/locator.dart';
import 'package:loginbasic/ui/shared/app_colors.dart';
import 'package:loginbasic/ui/widgets/login_header.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
        create: (context) => locator<LoginModel>(),
        child: Consumer<LoginModel>(
            builder: (context, model, child) => Scaffold(
                  backgroundColor: backgroundColor,
                  body: Column(
                    children: [
                      LoginHeader(controller: _controller),
                      model.state == ViewState.Busy
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () async {
                                var loginsuccess =
                                    await model.login(_controller.text);
                              },
                              style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.black,
                                  primary: Colors.white),
                              child: Text('Login'),
                            )
                    ],
                  ),
                )));
  }
}

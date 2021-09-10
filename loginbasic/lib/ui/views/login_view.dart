import 'package:flutter/material.dart';
import 'package:loginbasic/core/enums/enums_define.dart';
import 'package:loginbasic/core/viewmodels/login_viewmodel.dart';
import 'package:loginbasic/ui/shared/app_colors.dart';
import 'package:loginbasic/ui/views/base_view.dart';
import 'package:loginbasic/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        onModelReady: (model) {
          /* Call something on the model */
        },
        builder: (context, model, child) => Scaffold(
              backgroundColor: backgroundColor,
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginHeader(
                      controller: _controller,
                      validationMessage: model.errorMessage,
                    ),
                    model.state == ViewState.Busy
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () async {
                              var loginsuccess =
                                  await model.login(_controller.text);
                              if (loginsuccess) {
                                Navigator.pushNamed(context, '/');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.black, primary: Colors.white),
                            child: Text('Login'),
                          )
                  ],
                ),
              ),
            ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginbasic/core/viewmodels/home_model.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {},
      builder: (context, model, child) => Scaffold(

      ),
    );
  }

}
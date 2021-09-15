import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginbasic/core/enums/enums_define.dart';
import 'package:loginbasic/core/models/comment.dart';
import 'package:loginbasic/core/models/post.dart';
import 'package:loginbasic/core/models/user.dart';
import 'package:loginbasic/core/viewmodels/base_model.dart';
import 'package:loginbasic/core/viewmodels/post_model.dart';
import 'package:loginbasic/ui/shared/app_colors.dart';
import 'package:loginbasic/ui/shared/text_styles.dart';
import 'package:loginbasic/ui/shared/ui_helpers.dart';
import 'package:loginbasic/ui/widgets/comments.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class PostDetail extends StatelessWidget {
  final Post? post;
  PostDetail(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: backgroundColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post?.title ?? '', style: headerStyle,),
            Text('by ${Provider.of<User>(context).username}', style: TextStyle(fontSize: 9),),
            UIHelper.verticalSpaceMedium(),
            Text(post?.body ?? ''),
            Comments(post?.id ?? 0),
          ],
        ),
      ),
    );
  }
}
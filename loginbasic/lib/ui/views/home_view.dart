
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginbasic/core/enums/enums_define.dart';
import 'package:loginbasic/core/models/post.dart';
import 'package:loginbasic/core/models/user.dart';
import 'package:loginbasic/core/viewmodels/home_model.dart';
import 'package:loginbasic/ui/shared/app_colors.dart';
import 'package:loginbasic/ui/shared/text_styles.dart';
import 'package:loginbasic/ui/shared/ui_helpers.dart';
import 'package:loginbasic/ui/widgets/postlist_item.dart';
import 'package:provider/provider.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) {
        model.getPosts(Provider.of<User>(context).id);
      },
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: model.state == ViewState.Busy
              ? Center(child: CircularProgressIndicator(),)
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpaceLarge(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Welcome ${Provider.of<User>(context).username}', style: headerStyle,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('Here are all your posts', style: subHeaderStyle,),
              ),
              UIHelper.verticalSpaceLarge(),
              model.posts.isEmpty
                  ? Expanded(child: Text(''))
                  : Expanded(child: getPostsUI(model.posts))
            ],
          )
        ),
      ),
    );
  }

  Widget getPostsUI(List<Post> posts) => ListView.builder(
    itemCount: posts.length,
    itemBuilder: (BuildContext context, int index) {
      return PostListItem(
        post: posts[index],
        onTap: () {
          Navigator.pushNamed(context, '/post');
        },
      );
    }
  );
}
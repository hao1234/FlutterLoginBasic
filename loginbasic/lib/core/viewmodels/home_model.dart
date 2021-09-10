import 'package:loginbasic/core/enums/enums_define.dart';
import 'package:loginbasic/core/models/post.dart';
import 'package:loginbasic/core/services/api.dart';
import 'package:loginbasic/core/viewmodels/base_model.dart';
import 'package:loginbasic/locator.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();
  List<Post> posts = [];

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
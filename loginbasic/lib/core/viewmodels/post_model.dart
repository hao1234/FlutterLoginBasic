import 'package:loginbasic/core/enums/enums_define.dart';
import 'package:loginbasic/core/models/comment.dart';
import 'package:loginbasic/core/services/api.dart';
import 'package:loginbasic/core/viewmodels/base_model.dart';

import '../../locator.dart';

class PostModel extends BaseModel {
  Api _api = locator<Api>();
  List<Comment> comments = [];

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
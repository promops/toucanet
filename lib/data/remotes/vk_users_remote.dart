import '../objects/user/user_model.dart';
import 'vk_remote.dart';

class VKUsersRemote extends VKRemote {
  VKUsersRemote(String accessToken) : super(accessToken);

  Future<List<UserModel>> getUser({List<int> ids}) async {
    final result = await this.call('users.get', {
      'user_ids': ids,
      'fields': [
        'photo_200_orig',
        'photo_50',
        'photo_100',
        'status',
        'counters',
      ]
    });

    List<UserModel> users = [];
    result.body['response']
        .forEach((user) => {users.add(UserModel.fromJson(user))});

    return users;
  }
}

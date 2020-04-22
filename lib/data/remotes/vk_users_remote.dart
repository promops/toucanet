import '../models/user_model/user_model.dart';
import 'vk_remote.dart';

class VKUsersRemote extends VKRemote {
  VKUsersRemote(String accessToken) : super(accessToken);

  Future<UserModel> getUser({List<int> ids}) async {
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

    UserModel user = UserModel.fromJson(result.body['response'][0]);
    print(UserModel.fromJson(result.body['response'][0]));

    return user;
  }
}

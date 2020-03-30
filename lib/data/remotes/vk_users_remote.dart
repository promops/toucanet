import '../models/user_model/user_model.dart';
import 'vk_remote.dart';

class VKUsersRemote extends VKRemote {
  VKUsersRemote(String accessToken) : super(accessToken);

  Future<UserModel> getUser() async {
    final result = await this.call('users.get', {
      'fields': [
        'photo_200_orig',
        'photo_50',
        'photo_100',
      ]
    });

    UserModel user = UserModel.fromJson(result.body['response'][0]);

    return user;
  }
}

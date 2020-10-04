import 'package:toucanet/core/vk/vk.dart';


class VKUsersRemote
{
  final VK vk;
  VKUsersRemote(this.vk);

  // Future<List<UserModel>> getUser({List<int> ids}) async {
  //   final result = await this.vk.api.method('users.get', {
  //     'user_ids': ids,
  //     'fields': [
  //       'photo_200_orig',
  //       'photo_50',
  //       'photo_100',
  //       'status',
  //       'counters',
  //     ]
  //   });

  //   List<UserModel> users = [];
  //   result.forEach((user) => {users.add(UserModel.fromJson(user))});

  //   return users;
  // }
}

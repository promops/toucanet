import 'package:toucanet/data/remotes/vk_users_remote.dart';
import 'package:toucanet/data/repositories/accounts_repository.dart';

import '../models/message/conversation.dart';
import '../models/message/message.dart';
import '../models/user_model/user_model.dart';
import 'vk_remote.dart';

class VKMessagesRemote extends VKRemote {
  VKMessagesRemote(String accessToken) : super(accessToken);

  Future<List<Message>> getById(List<int> ids) async {
    final result =
        await this.call('messages.getById', {'fields': [], 'message_ids': ids});

    //Message message = Message.fromJson(result.body['response'][0]);

    print(result);
  }

  Future<List<Conversation>> getConversations(int offset,
      {int count = 2}) async {
    final result = await this.call('messages.getConversations',
        {'offset': offset, 'count': count, 'filter': 'all'});

    //print(result.body['response']['items']);

    List<Conversation> list = [];
    Conversation conversation;
    UserModel user;
    List<int> userIds = [];

    // Future.forEach(result.body['response']['items'], (void) async {

    // });

    result.body['response']['items'].forEach((item) async => {
          conversation = Conversation.fromJson(item['conversation']),
          conversation.lastMessage = Message.fromJson(item['last_message']),
          list.add(conversation)
        });

    list.forEach((item) => userIds.add(conversation.peer.id));

    //TODO: Сделать нормально одним запросом
    for (var conversation in list) {
      user = await VKUsersRemote(AccountsRepository().current.token)
          .getUser(ids: [conversation.peer.id]);
      conversation.senderFirstName = user.firstName;
      conversation.senderLastName = user.lastName;
      conversation.avatarUrl = user.photo50;
    }

    print(list);

    return list;
  }
}

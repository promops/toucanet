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

  }

  Future<List<Conversation>> getConversations(int offset,
      {int count = 10}) async {
    final result = await this.call('messages.getConversations',
        {'offset': offset, 'count': count, 'filter': 'all'});

    List<Conversation> conversationsList = [];
    Conversation conversation;
    List<int> userIds = [];


    result.body['response']['items'].forEach((item) async => {
          conversation = Conversation.fromJson(item['conversation']),
          conversation.lastMessage = Message.fromJson(item['last_message']),
          conversationsList.add(conversation)
        });

    conversationsList.forEach((item) => userIds.add(item.peer.id));


    var usersList = await VKUsersRemote(AccountsRepository().current.token).getUser(ids :userIds);
    print(usersList);

    print(conversationsList);

    print(usersList.length);

    print(conversationsList.length);


    for (int i = 0; i < conversationsList.length; i++) {
      UserModel user = usersList[i];


      conversationsList[i].senderFirstName = user.firstName;
      conversationsList[i].senderLastName = user.lastName;
      conversationsList[i].avatarUrl = user.photo50;
    }

    return conversationsList;
  }
}

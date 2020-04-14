import '../models/message/conversation.dart';
import '../models/message/message.dart';
import 'vk_remote.dart';

class VKMessagesRemote extends VKRemote {
  VKMessagesRemote(String accessToken) : super(accessToken);

  Future<List<Message>> getById(List<int> ids) async {
    final result = await this.call('messages.getById', {'fields': [], 'message_ids' : ids});

    //Message message = Message.fromJson(result.body['response'][0]);

    print(result);
  }

  Future<List<Conversation>> getConversations(int offset) async {}


  

}



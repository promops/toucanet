import 'package:toucanet/data/models/message/conversation_response.dart';

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

  Future<List<Conversation>> getConversations(int offset, {int count = 2}) async {

    final result = await this.call('messages.getConversations', {'offset': offset, 'count' : count, 'filter' : 'all'});

    //print(result.body['response']['items']);

    List<ConversationResponse> list = [];

    result.body['response']['items'].forEach((item)=>{
      list.add(ConversationResponse.fromJson(item))
      //print(item['conversation'])
    });

    print(list);

    
  
  }
}



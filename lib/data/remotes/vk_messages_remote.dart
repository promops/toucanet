import 'dart:math';

import '../objects/message/message.dart';
import '../objects/message/response.dart';
import 'vk_remote.dart';

class VKMessagesRemote extends VKRemote {
  VKMessagesRemote(String accessToken) : super(accessToken);

  Future<List<Message>> getById(List<int> ids) async {
    final result =
        await this.call('messages.getById', {'fields': [], 'message_ids': ids});

    //Message message = Message.fromJson(result.body['response'][0]);
  
  }

  Future<Response> getConversations(int offset, {int count = 10}) async {
    final result = await this.call('messages.getConversations', {
      'offset': offset,
      'count': count,
      'extended': 1,
      'filter': 'all',
      'fields': [
        'photo_200_orig',
        'photo_50',
        'photo_100',
        'status',
        'counters',
        'online'
      ]
    });

    var response = Response.fromJson(result.body['response']);


    return response;
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  Future<List<Message>> getHistory(int offset, int userId,
      {int count = 12}) async {
    final result = await this.call('messages.getHistory',
        {'offset': offset, 'rev': 0, 'count': count, 'user_id': userId});

    List<Message> messagesList = [];

    result.body['response']['items'].forEach((message) async => {
          messagesList.add(Message.fromJson(message)),
        });

    //messagesList.forEach((f)=> print(f.attachments));
    
    return messagesList;
  }

  Future<void> send(int userId, String message) async {
    final result = await this.call('messages.send', {
      'user_id': userId,
      'random_id': Random().nextInt(4294967295),
      'user_id': userId,
      'message': message
    });

    print(result);
  }
}

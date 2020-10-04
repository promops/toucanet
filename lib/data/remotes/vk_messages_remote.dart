import 'dart:math';

import 'package:toucanet/core/vk/vk.dart';



class VKMessagesRemote 
{
  final VK vk;
  VKMessagesRemote(this.vk);

  Stream<dynamic> get onMessage => this.vk.longpoll.stream;

  // Future<List<Message>> getById(List<int> ids) async 
  // {
  //   final result =
  //       await this.vk.api.method('messages.getById', {'fields': [], 'message_ids': ids});

  //   //Message message = Message.fromJson(result.body['response'][0]);
  // }

  // Future<Response> getConversations(int offset, {int count = 10}) async {
  //   final result = await this.vk.api.method('messages.getConversations', {
  //     'offset': offset,
  //     'count': count,
  //     'extended': 1,
  //     'filter': 'all',
  //     'fields': [
  //       'photo_200_orig',
  //       'photo_50',
  //       'photo_100',
  //       'status',
  //       'counters',
  //       'online'
  //     ]
  //   });

  //   var response = Response.fromJson(result);

  //   return response;
  // }

  // void printWrapped(String text) {
  //   final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  //   pattern.allMatches(text).forEach((match) => print(match.group(0)));
  // }

  // Future<List<Message>> getHistory(int offset, int userId,
  //     {int count = 12}) async {
  //   final result = await this.vk.api.method('messages.getHistory', {
  //     'offset': offset,
  //     'rev': 0,
  //     'count': count,
  //     'user_id': userId,
  //     'extended': 1
  //   });

  //   List<Message> messagesList = [];

  //   result['items'].forEach((message) async => {
  //         messagesList.add(Message.fromJson(message)),
  //       });

  //   return messagesList;
  // }

  // Future<void> send(int userId, String message, String type) async {
  //   var result = type == 'user'
  //       ? await this.vk.api.method('messages.send', {
  //           'user_id': userId,
  //           'random_id': Random().nextInt(4294967295),
  //           'message': message
  //         })
  //       : await this.vk.api.method('messages.send', {
  //           'peer_id': userId,
  //           'random_id': Random().nextInt(4294967295),
  //           'message': message
  //         });

  //   print(result);
  // }
}

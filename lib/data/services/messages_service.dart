import 'package:toucanet/data/repositories/conversations_repository.dart';
import 'package:toucanet/data/repositories/profiles_repository.dart';

import '../../app/models/conversation_view_model.dart';
import '../../app/models/message_view_model.dart';
import '../remotes/vk_messages_remote.dart';

const String _kDefaultUrl =
    'https://sun9-4.userapi.com/c840523/v840523166/2630e/yIvhXFkrTys.jpg?ava=1';

class MessagesService {
  final VKMessagesRemote messagesRemote;

  //Stream<dynamic> get onMessage => this.messagesRemote.vk.longpoll.stream;

  MessagesService(this.messagesRemote);

  ///Вернет список моделей [dialogModels] для вида с распехнутыми диалогами
  Future<List<ConversationViewModel>> getConversations(int offset,
      {int count = 10}) async {
    List<ConversationViewModel> dialogModels = [];

    Response response =
        await this.messagesRemote.getConversations(offset, count: count);

    ProfilesRepository().add(response.profiles);

    for (var item in response.items) {
      //Конвертим дату из unixtime и прибавляем часовой пояс
      DateTime _messageDate =
          DateTime.fromMillisecondsSinceEpoch(item.lastMessage.date * 1000)
              .add(Duration(hours: 3));

      String _hour = _messageDate.hour < 10
          ? '0${_messageDate.hour}'
          : '${_messageDate.hour}';
      String _minute = _messageDate.minute < 10
          ? '0${_messageDate.minute}'
          : '${_messageDate.minute}';

      if (item.conversation.peer.type == DialogTypes.chat) {
        dialogModels.add(ConversationViewModel(
          lastMessage: item.lastMessage.text,
          lastMessageDate: '$_hour:$_minute',
          lastMessageDateNumber: item.lastMessage.date,
          avatarUrl: _kDefaultUrl,
          title: '${item.conversation.chatSettings.title}',
          out: item.conversation.chatSettings.state == 'in' ? false : true,
          online: false,
          peerId: item.conversation.peer.id,
          type: DialogTypes.chat,
        ));
      } else {
        UserModel sender = response.profiles.firstWhere(
            (user) => user.id == item.conversation.peer.id,
            orElse: () => UserModel.empty());

        dialogModels.add(ConversationViewModel(
            lastMessage: item.lastMessage.text,
            lastMessageDate: '$_hour:$_minute',
            lastMessageDateNumber: item.lastMessage.date,
            avatarUrl: sender.photo100,
            peerId: sender.id,
            online: sender.online == 1 ? true : false,
            out: item.lastMessage.out == 1 ? true : false,
            type: DialogTypes.user,
            title: '${sender.firstName} ${sender.lastName}'));
      }
    }

    //ConversationsRepository().add(dialogModels);
    ConversationsRepository().addConversation(dialogModels);

    return dialogModels;
  }

  ///Вернет список сообщений из диалога
  Future<List<MessageViewModel>> getHistory(int offset, int userId) async {
    List<MessageViewModel> messagesList = [];
    print(offset);

    List<Message> messages =
        await this.messagesRemote.getHistory(offset, userId);

    for (var message in messages) {
      messagesList.add(MessageViewModel(
          senderAvatarUrl: ProfilesRepository().getById(message.id).photo50,
          out: message.out != 1,
          id: message.fromId,
          text: message.text,
          date: message.date,
          attachments: message.attachments));
    }

    // messagesList
    //     .forEach((element) => ConversationsRepository().addMessage(element));

    return messagesList;
  }

  void initLonpull() {
    this.messagesRemote.vk.longpoll.stream.listen((event) {
      Message message = Message.fromJson(event);

      print(event);

      ConversationsRepository().setLastMessage(message.text,
          message.out == 1 ? message.peerId : message.fromId, message.date);
    });
  }
}

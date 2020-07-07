import 'package:toucanet/app/models/conversation_view_model.dart';
import 'package:toucanet/app/models/message_view_model.dart';
import 'package:toucanet/data/objects/enums/dialog_types.dart';
import 'package:toucanet/data/repositories/stored_interface.dart';

class ConversationsRepository {
  //TODO Избавиться от синглтона
  static final ConversationsRepository _instance = ConversationsRepository._();
  ConversationsRepository._();
  factory ConversationsRepository() => _instance;

  List<ConversationViewModel> _conversationsList = [];

  Function onChange;

  get list => _conversationsList;

  //Добавить беседу
  void addConversation<T>(T conversation) {
    if (conversation is ConversationViewModel)
      _conversationsList.add(conversation);

    if (conversation is List<ConversationViewModel>)
      _conversationsList..addAll(conversation);
  }

  // //Добавить сообщение в беседу
  // void addMessage(MessageViewModel message) {
  //   int _index = _conversationsList
  //       .indexWhere((element) => element.peerId == message.id);

  //   //Если такой конференции не было, то создаем
  //   if (_index < 0) {
  //     _conversationsList.add(ConversationViewModel(
  //         peerId: message.id,
  //         online: false,
  //         out: message.out,
  //         lastMessage: message.text,
  //         //TODO как то решить этот момент
  //         type: DialogTypes.user,
  //         title: message.senderLastName));

  //     return;
  //   }

  //   //Если такая есть, то добавляем в нее сообщение и обновляем информацию
  //   //_conversationsList[_index].addMessage(message);
  //   _conversationsList[_index].lastMessage = message.text;
  //   _conversationsList[_index].unreadCount++;

  //   if (this.onChange != null) this.onChange();
  // }

  void setLastMessage(String text, int id, int newDate) {
    print(id);
    int _index =
        _conversationsList.indexWhere((element) => element.peerId == id);

    if (_index < 0) {
      print('no index');
      throw UnimplementedError();
    }

    print(_index);
    _conversationsList[_index].lastMessage = text;
    _conversationsList[_index].lastMessageDateNumber = newDate;

    _conversationsList.sort(
        (a, b) => b.lastMessageDateNumber.compareTo(a.lastMessageDateNumber));
    print('on change');
    if (this.onChange != null) this.onChange();
  }

  //Пометить все сообщения как прочитанные
  void markAsRead(ConversationViewModel conversation) => _conversationsList
      .firstWhere((element) => element.peerId == conversation.peerId)
      .unreadCount = 0;

  List<ConversationViewModel> getConversations() {
    return this._conversationsList.take(10).toList();
  }

  List<MessageViewModel> getMessages(int id) {
    return _conversationsList
        .firstWhere((element) => element.peerId == id)
        .messages;
  }
}

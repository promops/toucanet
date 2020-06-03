import 'package:toucanet/app/models/conversation_view_model.dart';
import 'package:toucanet/app/models/message_view_model.dart';
import 'package:toucanet/data/objects/enums/dialog_types.dart';
import 'package:toucanet/data/repositories/stored_interface.dart';

class ConversationsRepository implements Stored {
  static final ConversationsRepository _instance = ConversationsRepository._();
  ConversationsRepository._();
  factory ConversationsRepository() => _instance;

  List<ConversationViewModel> _conversationsList = [];

  Function onChange;

  get list => _conversationsList;

  void addConversation<T>(T conversation) {
    if (conversation is ConversationViewModel)
      _conversationsList.add(conversation);

    if (conversation is List<ConversationViewModel>)
      _conversationsList..addAll(conversation);
  }

  @override
  void addMessage(MessageViewModel message) {
    int _index = _conversationsList
        .indexWhere((element) => element.peerId == message.id);

    //Если такой конференции не было, то создаем
    if (_index < 0) {
      _conversationsList.add(ConversationViewModel(
          peerId: message.id,
          online: false,
          out: message.out,
          lastMessage: message.text,
          //TODO как то решить этот момент
          type: DialogTypes.user,
          title: message.senderLastName));

      return;
    }

    //Если такая есть, то добавляем в нее сообщение и обновляем информацию
    _conversationsList[_index].addMessage(message);
    _conversationsList[_index].lastMessage = message.text;
    _conversationsList[_index].unreadCount++;
  }

  @override
  List<ConversationViewModel> getConversations() {
    // TODO: implement getConversations
    throw UnimplementedError();
  }

  @override
  MessageViewModel getMessages() {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  // void update(ConversationViewModel conversation) {
  //   if (_conversationsList.contains(conversation)) {
  //     int index = _conversationsList.indexOf(conversation);
  //     _conversationsList.replaceRange(index, index + 1, [conversation]);

  //     if (this.onChange != null) this.onChange();
  //   }
  // }

}

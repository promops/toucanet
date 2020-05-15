import 'package:toucanet/app/view_models/dialog_view_model.dart';

class ConversationsRepository {
  static final ConversationsRepository _instance = ConversationsRepository._();
  ConversationsRepository._();
  factory ConversationsRepository() => _instance;

  List<DialogViewModel> _conversationsList = [];

  Function onChange;

  get list => _conversationsList;

  void add<T>(T conversations) {
    //conversationsList.add(conversation);
    if (conversations is DialogViewModel) _conversationsList.add(conversations);

    if (conversations is List<DialogViewModel>)
      _conversationsList..addAll(conversations);
  }

  void update(DialogViewModel conversation) {
    if (_conversationsList.contains(conversation)) {
      int index = _conversationsList.indexOf(conversation);
      _conversationsList.replaceRange(index, index + 1, [conversation]);

      if (this.onChange != null) this.onChange();
    }
  }
}

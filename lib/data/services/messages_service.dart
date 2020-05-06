import '../../app/view_models/dialog_view_model.dart';
import '../../app/view_models/message_view_model.dart';
import '../objects/enums/dialog_types.dart';
import '../objects/message/message.dart';
import '../objects/message/response.dart';
import '../objects/user/user_model.dart';
import '../remotes/vk_messages_remote.dart';
import '../repositories/accounts_repository.dart';

const String _kDefaultUrl =
    'https://sun9-4.userapi.com/c840523/v840523166/2630e/yIvhXFkrTys.jpg?ava=1';

class MessagesService {
  ///Вернет список моделей [dialogModels] для вида с распехнутыми диалогами
  Future<List<DialogViewModel>> getConversations(int offset) async {
    List<DialogViewModel> dialogModels = [];

    Response response =
        await VKMessagesRemote(AccountsRepository().current.token)
            .getConversations(offset);

    for (var item in response.items) {
      if (item.conversation.peer.type == DialogTypes.chat) {
        dialogModels.add(DialogViewModel(
          lastMessage: item.lastMessage.text,
          avatarUrl: _kDefaultUrl,
          title: '${item.conversation.chatSettings.title}',
          out: item.conversation.chatSettings.state == 'in' ? false : true,
          online: false,
          id: item.conversation.peer.id,
          type: DialogTypes.chat,
        ));
      } else {
        UserModel sender = response.profiles.firstWhere(
            (user) => user.id == item.conversation.peer.id,
            orElse: () => UserModel(
                firstName: 'asd', lastName: '123', photo50: _kDefaultUrl));

        dialogModels.add(DialogViewModel(
            lastMessage: item.lastMessage.text,
            avatarUrl: sender.photo50,
            id: sender.id,
            online: sender.online == 1 ? true : false,
            out: item.lastMessage.out == 1 ? true : false,
            type: DialogTypes.user,
            title: '${sender.firstName} ${sender.lastName}'));
      }
    }

    return dialogModels;
  }

  Future<List<MessageViewModel>> getHistory(int offset, int userId) async {
    List<Message> messages =
        await VKMessagesRemote(AccountsRepository().current.token)
            .getHistory(offset, userId);
  }
}

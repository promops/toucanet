import 'package:toucanet/app/view_models/dialog_view_model.dart';
import 'package:toucanet/data/objects/user_model/user_model.dart';

import '../objects/message/response.dart';
import '../remotes/vk_messages_remote.dart';
import '../repositories/accounts_repository.dart';

class MessagesService {
  ///Вернет список моделей [dialogModels] для вида с распехнутыми диалогами
  Future<List<DialogViewModel>> getConversations(int offset) async {
    List<DialogViewModel> dialogModels = [];
    DialogViewModel model;

    Response response =
        await VKMessagesRemote(AccountsRepository().current.token)
            .getConversations(offset);

    for (var item in response.items) {
      if (item.conversation.peer.type == 'chat') {
        dialogModels.add(DialogViewModel(
            lastMessage: item.lastMessage.text,
            avatarUrl: item.conversation.chatSettings.photo.photo50,
            title: '${item.conversation.chatSettings.title}'));
      } else {
        UserModel sender = response.profiles.firstWhere(
            (user) => user.id == item.conversation.peer.id,
            orElse: () =>
                UserModel(firstName: 'asd', lastName: '123', photo50: 'https://sun9-4.userapi.com/c840523/v840523166/2630e/yIvhXFkrTys.jpg?ava=1'));

        dialogModels.add(DialogViewModel(
            lastMessage: item.lastMessage.text,
            avatarUrl: sender.photo50,
            id: sender.id,
            online: sender.online == 1 ? true : false,
            title: '${sender.firstName} ${sender.lastName}'));
      }
    }

    //print(response.items);

    //dialogModels.forEach((f) => print(f.avatarUrl));

    return dialogModels;
  }
}

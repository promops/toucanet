import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toucanet/app/widgets/loading_indicator.dart';
import '../../../blocs/dialog_bloc/dialog_bloc.dart';
import '../dialog_page/text_message_widget.dart';
import '../../../../core/helper/push_manager.dart';
import '../../../../data/models/message/message.dart';
import '../../../../data/remotes/vk_account_remote.dart';
import '../../../../data/repositories/accounts_repository.dart';

import '../../../styles/app_colors.dart';
import '../../../styles/fonts.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/app_bar/widgets/backward_button.dart';
import 'widgets/dialog_widget.dart';

class DialogListPage extends StatefulWidget {
  @override
  _DialogListPageState createState() => _DialogListPageState();
}

class _DialogListPageState extends State<DialogListPage> {
  Message _message;

  @override
  void initState() {
    _message = Message(id: 1, text: 'Hi', direction: MessageDirection.IN);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DialogBloc>(context).add(FetchDialogs(2));

    return Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: CustomAppBar(
          title: Text('Диалоги', style: Fonts.h1),
        ),
        body: 

        BlocBuilder(
          bloc: BlocProvider.of<DialogBloc>(context),
          builder: (BuildContext context, DialogState state)
          {
            if(state is DialogList){
              return ListView(
                children: <Widget>[
                  for(var dialog in state.dialogs)
                    DialogWidget(conversation: dialog,)
                ],
              );
            }

            return LoadingIndicator();
          }
          )
        // ListView(
        //   children: <Widget>[
         //    DialogWidget(message: _message),
        //     DialogWidget(message: _message),
        //     DialogWidget(message: _message),
        //     RaisedButton(
        //         child: Text('register'),
        //         onPressed: () async => {
        //               await VKAccountRemote(AccountsRepository().current.token)
        //                   .registerDevice()
        //             }),
        //     RaisedButton(
        //         child: Text('unregister'),
        //         onPressed: () async => {
        //               await VKAccountRemote(AccountsRepository().current.token)
        //                   .unregisterDevice()
        //             }),

        //             RaisedButton(
        //         child: Text('push'),
        //         onPressed: () async => {
        //               await PushManager().displayNotification('test push')
        //             })
        //   ],
        // )
        
        );
  }
}

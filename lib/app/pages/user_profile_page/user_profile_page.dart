import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user_bloc/user_bloc.dart';
import '../../styles/app_colors.dart';
import '../../styles/fonts.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/app_bar/widgets/backward_button.dart';
import 'widgets/user_avatar.dart';
import 'widgets/user_information.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(FetchUserEvent());

    return BlocBuilder(
        bloc: BlocProvider.of<UserBloc>(context),
        builder: (context, UserState state) {
          if (state is UserInformation) {
            var currentUser = state.user;
            return Scaffold(
                backgroundColor: AppColors.mainColor,
                appBar: CustomAppBar(
                  title: Text('Профиль', style: Fonts.h1),
                ),
                body: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    UserAvatar(
                      url: currentUser.photo100,
                    ),
                    UserInformationWidget(
                      firstName: currentUser.firstName,
                      lastName: currentUser.lastName,
                    )
                  ],
                ));
          }

          return CircularProgressIndicator();
        });
  }
}

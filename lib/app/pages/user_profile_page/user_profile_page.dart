import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/objects/user/user_model.dart';
import '../../blocs/user_bloc/user_bloc.dart';
import '../../styles/app_colors.dart';
import '../../styles/fonts.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/loading_indicator.dart';
import 'widgets/user_avatar.dart';
import 'widgets/user_information.dart';
import 'widgets/user_status.dart';

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
            UserModel currentUser = state.user;
            return Scaffold(
                backgroundColor: AppColors.mainColor,
                appBar: CustomAppBar(
                  title: Text('Профиль', style: Fonts.h1),
                ),
                body: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        UserAvatar(
                          url: currentUser.photo100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            UserInformationWidget(
                              firstName: currentUser.firstName,
                              lastName: currentUser.lastName,
                            ),
                            UserStatus(
                              status: currentUser.status,
                            ),
                          ],
                        ),
                      ],
                    ),
                    // UserCountersWidget(
                    //   userCounters: currentUser.userCounters,
                    // )
                  ],
                ));
          }

          return LoadingIndicator();
        });
  }
}

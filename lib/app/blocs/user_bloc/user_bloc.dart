import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/user_model/user_model.dart';
import '../../../data/remotes/vk_users_remote.dart';
import '../../../data/repositories/accounts_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is FetchUserEvent) {
      List<UserModel> user =
          await VKUsersRemote(AccountsRepository().current.token).getUser();

      yield UserInformation(user[0]);
    }
  }
}

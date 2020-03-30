part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserInformation extends UserState {
  UserInformation(this.user);
  final UserModel user;
  
  @override
  List<Object> get props => [];
}

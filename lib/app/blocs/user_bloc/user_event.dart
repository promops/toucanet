part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class FetchUserEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

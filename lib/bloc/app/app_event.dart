part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent();

  factory AppEvent.started() => _AppStarted();

  @override
  List<Object> get props => [];
}

class _AppStarted extends AppEvent {}

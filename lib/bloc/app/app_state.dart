part of 'app_bloc.dart';

enum AppStatus { unknown, loaded }

@immutable
class AppState extends Equatable {
  final AppStatus status;

  const AppState._({@required this.status});

  const AppState.loaded() : this._(status: AppStatus.loaded);

  const AppState.unknown() : this._(status: AppStatus.unknown);

  @override
  List<Object> get props => [status];
}

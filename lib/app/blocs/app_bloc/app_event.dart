part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable 
{}

class AppStarted extends AppEvent
{
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AppStarted';
}
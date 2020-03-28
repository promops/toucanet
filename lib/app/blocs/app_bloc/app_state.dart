part of 'app_bloc.dart';

@immutable
abstract class AppState extends Equatable 
{}

class AppInitialState extends AppState 
{
  final bool isAuth;

  AppInitialState(this.isAuth);

  @override
  List<Object> get props => [isAuth];

  @override
  String toString() => 'InitialAppState';
}

class AppUninitializedState extends AppState 
{
  @override
  List<Object> get props => [];

  @override
  String toString() => 'UninitializedAppState';
}
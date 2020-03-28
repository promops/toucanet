import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:toucanet/data/repositories/account_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> 
{
  final AccountRepository _accountRepository;

  AppBloc(this._accountRepository); 

  @override
  AppState get initialState => AppUninitializedState();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* 
  {
    if (event is AppStarted) 
    {
      yield AppInitialState(this._accountRepository.isAuth);
    }
  }
}

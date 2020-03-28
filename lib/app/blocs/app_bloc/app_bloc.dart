import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:toucanet/data/services/account_service.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> 
{
  final AccountService _accountService;

  AppBloc(this._accountService); 

  @override
  AppState get initialState => AppUninitializedState();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* 
  {
    if (event is AppStarted) {
      yield AppInitialState(this._accountService.hasAccount);
    }
  }
}

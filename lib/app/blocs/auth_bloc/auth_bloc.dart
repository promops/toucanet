import 'auth.dart';
import 'package:bloc/bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc();

  @override
  AuthState get initialState => AuthInitState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthInit) {
      yield AuthInitState();
    }
    if (event is AuthSignIn) {
      yield AuthSignInState();
    }
    if(event is AuthServerError){
      yield AuthServerErrorState();
    }
    if(event is AuthUserAgreed){
      yield AuthSuccessState();
    }
    if(event is AuthLoad){
      yield AuthLoadState();
    }
    if(event is AuthFinishLoad){
      yield AuthFinishLoadState();
    }
      // if(User.fromRepository(event.json))
      // {
      //   print('AuthSuccessState');
      //   yield AuthSuccessState();
      // }
      // else
      // { 
      //   print('AuthErrorState');
      //   yield AuthErrorState();
      // }
    
  }
}
import 'package:equatable/equatable.dart';

class AuthState extends Equatable{ 
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class AuthInitState extends AuthState{

}

class AuthSignInState extends AuthState{

}

class AuthErrorState extends AuthState{

}

class AuthSuccessState extends AuthState{

}
class AuthServerErrorState extends AuthState{
  
}
class AuthLoadState extends AuthState{

}
class AuthFinishLoadState extends AuthState{

}
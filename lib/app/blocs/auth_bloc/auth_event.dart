import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class AuthInit extends AuthEvent{

}
class AuthSignIn extends AuthEvent{

}

class AuthUserAgreed extends AuthEvent{
}
class AuthServerError extends AuthEvent{

}
class AuthLoad extends AuthEvent{

}
class AuthFinishLoad extends AuthEvent{
  
}
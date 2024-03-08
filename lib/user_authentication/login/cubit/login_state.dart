part of 'login_cubit.dart';

@immutable
abstract class LoginStates {}

class LoginInitialState extends LoginStates {}


class LoginSuccessState extends LoginStates {
  final  String token ;
  LoginSuccessState(this.token);
}


class LoginFailureState extends LoginStates {
  final String errorMessage ;
  LoginFailureState(this.errorMessage);
}

class LoginLoadingState extends LoginStates{}


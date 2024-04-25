part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordStates {}

class ResetPasswordInitialState extends ResetPasswordStates {}

class ResetPasswordSuccessState extends ResetPasswordStates{
  final String message ;
  ResetPasswordSuccessState(this.message);
}

class ResetPasswordLoadingState extends ResetPasswordStates{}

class ResetPasswordFailureState extends ResetPasswordStates{
  final String errorMessage ;
  ResetPasswordFailureState(this.errorMessage);
}

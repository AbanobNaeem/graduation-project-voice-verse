part of 'email_verification_cubit.dart';

@immutable
abstract class EmailVerificationStates {}

class EmailVerificationInitialState extends EmailVerificationStates {}


class CodeTrueState extends EmailVerificationStates {}

class CodeFalseState extends EmailVerificationStates{
  final String errorMessage ;
  CodeFalseState(this.errorMessage);
}

class CheckCodeLoadingState extends EmailVerificationStates{}


class ReSendCodeSuccessState extends EmailVerificationStates {}

class ReSendCodeFailureState  extends EmailVerificationStates{
  final String errorMessage ;
  ReSendCodeFailureState(this.errorMessage);
}
part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordStates {}

class ForgetPasswordInitialState extends ForgetPasswordStates {}

class SendCodeLoadingState extends ForgetPasswordStates {

}
class SendCodeSuccessState extends ForgetPasswordStates {}

class SendCodeFailureState extends ForgetPasswordStates {
  final String errorMessage ;
  SendCodeFailureState(this.errorMessage);
}

class ReSendCodeSuccessState extends ForgetPasswordStates {}

class ReSendCodeFailureState  extends ForgetPasswordStates{
  final String errorMessage ;
  ReSendCodeFailureState(this.errorMessage);
}
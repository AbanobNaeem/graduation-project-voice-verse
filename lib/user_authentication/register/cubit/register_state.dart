part of 'register_cubit.dart';

@immutable
abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}


class RegisterSuccessState extends RegisterStates {}

class RegisterFailureState extends RegisterStates {
  final String errorMessage ;
  RegisterFailureState(this.errorMessage);
}

class RegisterLoadingState extends RegisterStates {}



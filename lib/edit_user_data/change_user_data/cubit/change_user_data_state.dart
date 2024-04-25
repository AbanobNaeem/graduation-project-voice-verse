part of 'change_user_data_cubit.dart';

@immutable
abstract class ChangeUserDataStates {}

class ChangeUserDataInitialState extends ChangeUserDataStates {}

class ChangePasswordSuccessState extends ChangeUserDataStates{}

class ChangePasswordFailureState extends ChangeUserDataStates{
  final String errorMessage ;
  ChangePasswordFailureState(this.errorMessage);
}

class ChangePasswordLoadingState extends ChangeUserDataStates{}


class ChangeNameSuccessState extends ChangeUserDataStates{}

class ChangeNameFailureState extends ChangeUserDataStates{
  final String errorMessage ;
  ChangeNameFailureState(this.errorMessage);
}

class ChangeNameLoadingState extends ChangeUserDataStates{}
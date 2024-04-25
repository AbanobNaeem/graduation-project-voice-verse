part of 'user_profile_cubit.dart';

@immutable
abstract class UserProfileStates {}

class UserProfileInitialState extends UserProfileStates {}


class GetDataSuccessState extends UserProfileStates{
  final UserDataModel user ;
  GetDataSuccessState(this.user);
}

class GetDataLoadingState extends UserProfileStates{}

class GetDataFailureState extends UserProfileStates{
  final String errorMessage ;
  GetDataFailureState(this.errorMessage);
}

class LogOutSuccessState extends UserProfileStates {}

class LogOutFailureState extends UserProfileStates {
  final String errorMessage ;
  LogOutFailureState(this.errorMessage);
}



class DeleteAccountSuccessState extends UserProfileStates {}

class DeleteAccountFailureState extends UserProfileStates {
  final String errorMessage ;
  DeleteAccountFailureState(this.errorMessage);
}
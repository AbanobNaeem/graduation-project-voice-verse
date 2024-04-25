part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileStates {}

class EditProfileInitialState extends EditProfileStates {}







class UserProfileUploadSuccess extends EditProfileStates {}

class UserProfileUploadFailure extends EditProfileStates {
  final String errorMessage;

  UserProfileUploadFailure(this.errorMessage);
}




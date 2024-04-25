part of 'upload_video_cubit.dart';

@immutable
abstract class UploadVideoStates {}

class UploadVideoInitialState extends UploadVideoStates {}

class UploadVideoSuccessState extends UploadVideoStates {}

class UploadVideoLoadingState extends UploadVideoStates{}

class UploadVideoFailureState extends UploadVideoStates {
  final String errorMessage ;
  UploadVideoFailureState(this.errorMessage);
}

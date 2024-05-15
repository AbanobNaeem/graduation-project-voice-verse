part of 'uploaded_videos_cubit.dart';

@immutable
sealed class UploadedVideosStates {}

final class UploadedVideosInitialState extends UploadedVideosStates {}


class GetUploadedVideosSuccessState extends UploadedVideosStates{
  final UploadedVideosModel uploadedVideosModel ;
  GetUploadedVideosSuccessState(this.uploadedVideosModel);
}

class GetUploadedVideosFailureState extends UploadedVideosStates {
  final String errorMessage ;
  GetUploadedVideosFailureState(this.errorMessage);
}

class GetUploadedVideoLoadingState extends UploadedVideosStates {}


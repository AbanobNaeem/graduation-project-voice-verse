part of 'dubbing_cubit.dart';

@immutable
sealed class DubbingStates {}

final class DubbingInitialState extends DubbingStates {}

final class GetDubbingOutPutSuccessState extends DubbingStates {
  final DubbingModel dubbingModel ;
  GetDubbingOutPutSuccessState(this.dubbingModel);
}

final class GetDubbingOutPutFailureState extends DubbingStates {
  final String errorMessage ;
  GetDubbingOutPutFailureState(this.errorMessage );
}

final class GetDubbingOutPutLoadingState extends DubbingStates{}

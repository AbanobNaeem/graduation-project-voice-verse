part of 'dubbing_cubit.dart';

@immutable
sealed class DubbingStates {}

final class DubbingInitialState extends DubbingStates {}

class DubbingSuccessState extends DubbingStates{}

class DubbingFailureState extends DubbingStates {
   String errorMessage  ;
  DubbingFailureState (this.errorMessage);
}

class DubbingLoadingState extends DubbingStates {

}

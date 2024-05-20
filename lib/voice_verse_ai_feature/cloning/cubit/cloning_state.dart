part of 'cloning_cubit.dart';

@immutable
sealed class CloningStates {}

final class CloningInitialState extends CloningStates {}

final class  CloningSuccessState extends CloningStates {}

final class CloningFailureState extends CloningStates {
  final String errorMessage ;
  CloningFailureState (this.errorMessage);
}
final class CloningLoadingState extends CloningStates {}
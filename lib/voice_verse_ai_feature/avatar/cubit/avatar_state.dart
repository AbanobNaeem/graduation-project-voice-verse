part of 'avatar_cubit.dart';

@immutable
sealed class AvatarStates {}

final class AvatarInitialState extends AvatarStates {}

final class AvatarSuccessState extends AvatarStates {}

final class AvatarFailureState extends AvatarStates{
  final String errorMessage;
  AvatarFailureState(this.errorMessage);
}

final class AvatarLoadingState extends AvatarStates{}

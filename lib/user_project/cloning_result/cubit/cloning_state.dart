part of 'cloning_cubit.dart';

@immutable
sealed class CloningStates {}

final class CloningInitialState extends CloningStates {}

final class GetCloningOutPutSuccessState extends CloningStates{
  final CloningModel cloningModel ;
  GetCloningOutPutSuccessState(this.cloningModel);
}

final class GetCloningOutPutFailureState extends CloningStates{
  final String errorMessage ;
  GetCloningOutPutFailureState(this.errorMessage);
}

final class GetCloningOutPutLoadingState extends CloningStates{}

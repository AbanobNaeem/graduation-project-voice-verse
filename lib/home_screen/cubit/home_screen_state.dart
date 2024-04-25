part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenStates {}

class HomeScreenInitialState extends HomeScreenStates {}

class GetVideosSuccessState extends HomeScreenStates{
  final ReelsDataModel reel ;
 GetVideosSuccessState(this.reel);
}

class GetVideoFailureState extends HomeScreenStates {
  final String errorMessage ;
  GetVideoFailureState(this.errorMessage);
}


class AddToFavoriteSuccessState extends HomeScreenStates{}

class AddTOFavoriteFailureState extends HomeScreenStates{
  final String errorMessage;
  AddTOFavoriteFailureState(this.errorMessage);
}


class RemoveFromFavoriteSuccessState extends HomeScreenStates{}

class RemoveFromFavoriteFailureState extends HomeScreenStates{
  final String errorMessage;
  RemoveFromFavoriteFailureState(this.errorMessage);
}

class GetFavoriteListSuccessState extends HomeScreenStates{
  final FavoriteList favoriteList ;
  GetFavoriteListSuccessState(this.favoriteList);
}

class GetFavoriteListFailureState extends HomeScreenStates {
  final String errorMessage ;
  GetFavoriteListFailureState(this.errorMessage);
}


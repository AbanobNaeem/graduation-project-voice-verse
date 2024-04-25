part of 'favorite_cubit.dart';

@immutable
abstract class FavoritesStates {}

class FavoriteInitialState extends FavoritesStates {}

class GetFavoritesSuccess extends FavoritesStates {
  final FavoriteList favoriteList ;
  GetFavoritesSuccess(this.favoriteList);
}

class GetFavoritesFailure extends FavoritesStates{
  final String errorMessage ;
  GetFavoritesFailure(this.errorMessage);

}

class GetFavoritesLoading extends FavoritesStates {}






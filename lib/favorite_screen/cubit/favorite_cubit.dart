import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
import 'package:voice_verse/models/favorite_list.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoritesStates> {
  HttpConsumer httpConsumer = HttpConsumer();
  final String? token = PreferenceUtils.instance.getString(ApiKey.token);

  FavoriteCubit() : super(FavoriteInitialState());

  Future<void> getFavorites() async {
    try {
      emit(GetFavoritesLoading());
      final response = await httpConsumer.get(
        EndPoint.getFavoriteList,
        headers: {"token": "@V*ice_Verse$token"},
      );
      emit(GetFavoritesSuccess(FavoriteList.fromJson(response)));
    }catch(error){
      emit(GetFavoritesFailure(error.toString()));
    }
  }

  Future<void> removeFromFavoritesScreen({
    required String id
  }) async{
    try{
      final response = await httpConsumer.delete(
        baseUrl: '${EndPoint.removeFromFavorites}$id',
        headers:{
          "token":"@V*ice_Verse$token"
        },
      );

      if (response.statusCode == 200) {
        PreferenceUtils.instance.setBool(id,false);
        emit(RemoveFromFavoriteSuccess());
      }
      else {
        emit(RemoveFromFavoriteFailure(httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }

    }catch(e){
      emit(RemoveFromFavoriteFailure(e.toString()));
    }
  }


}

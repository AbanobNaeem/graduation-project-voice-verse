import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
import 'package:voice_verse/models/favorite_list.dart';
import 'package:voice_verse/models/reels_data_model.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());
  HttpConsumer httpConsumer = HttpConsumer();
  final List<bool> favoriteStatusList = [];
  final String? token = PreferenceUtils.instance.getString(ApiKey.token);

  Future<void> getReelsData() async {
    try {
      final response = await httpConsumer.get(
        EndPoint.getVideos,
        headers: {"token": "@V*ice_Verse$token"},
      );
      emit(GetVideosSuccessState(ReelsDataModel.fromJson(response)));
    }catch(error){
      emit(GetVideoFailureState(error.toString()));
    }
  }

  Future<void> addToFavorites({
    required String videoUrl
}) async{
    try{
      final response = await httpConsumer.post(
          data: {
            "url": videoUrl
          },
          baseUrl: EndPoint.addToFavorites,
          headers:{
            "Content-Type": "application/json",
            "token":"@V*ice_Verse$token"
          },
      );
      if (response.statusCode == 200) {
        emit(AddToFavoriteSuccessState());
      }
      else {
        AddTOFavoriteFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]);
      }
    }catch(e){
      AddTOFavoriteFailureState(e.toString());
    }
  }

  Future<void> removeFromFavorites({
    required String videoUrl
  }) async{
    try{
      final response = await httpConsumer.delete(
        data: {
          "url": videoUrl
        },
        baseUrl: EndPoint.removeFromFavorites,
        headers:{
          "Content-Type": "application/json",
          "token":"@V*ice_Verse$token"
        },
      );
      if (response.statusCode == 200) {
        emit(RemoveFromFavoriteSuccessState());
      }
      else {
        RemoveFromFavoriteFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]);
      }
    }catch(e){
      RemoveFromFavoriteFailureState(e.toString());
    }
  }

}

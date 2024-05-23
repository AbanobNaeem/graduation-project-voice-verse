import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
import 'package:voice_verse/models/reels_data_model.dart';

import '../../models/favorite_list.dart';

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
    required String id
}) async{
    try{
      final response = await httpConsumer.post(
          baseUrl: '${EndPoint.addToFavorites}$id',
          headers:{
            "token":"@V*ice_Verse$token"
          },
      );
      print("response==================>${response.body}");
      if (response.statusCode == 200) {
        emit(AddToFavoriteSuccessState());
      }
      else {
        print("error======> ${ApiKey.errorMessage}");
        emit(AddTOFavoriteFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }
    }catch(e){
      emit(AddTOFavoriteFailureState(e.toString()));
      print(e.toString());
    }
  }


  Future<void> removeFromFavorites({
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
        emit(RemoveFromFavoriteSuccessState());
      }
      else {
        emit(RemoveFromFavoriteFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }

    }catch(e){
      emit(RemoveFromFavoriteFailureState(e.toString()));
    }
  }

}

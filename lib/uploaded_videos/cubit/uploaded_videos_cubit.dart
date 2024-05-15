import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
import 'package:voice_verse/models/uploaded_videos_model.dart';

part 'uploaded_videos_state.dart';

class UploadedVideosCubit extends Cubit<UploadedVideosStates> {
  UploadedVideosCubit() : super(UploadedVideosInitialState());
  HttpConsumer httpConsumer = HttpConsumer();
  final String? token = PreferenceUtils.instance.getString(ApiKey.token);


  Future<void> getUploadedVideos() async {
    try {
      emit(GetUploadedVideoLoadingState());
      final response = await httpConsumer.get(
        EndPoint.getUploadedVideos,
        headers: {"token": "@V*ice_Verse$token"},
      );
      emit(GetUploadedVideosSuccessState(UploadedVideosModel.fromJson(response)));
    }catch(error){
      emit(GetUploadedVideosFailureState(error.toString()));
    }
  }

}

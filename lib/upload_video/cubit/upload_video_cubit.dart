import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';

part 'upload_video_state.dart';

class UploadVideoCubit extends Cubit<UploadVideoStates> {
  UploadVideoCubit() : super(UploadVideoInitialState());
  HttpConsumer httpConsumer = HttpConsumer();
  final String? token = PreferenceUtils.instance.getString(ApiKey.token);

  Future<void> uploadVideo({
    required String videoUrl,
    required String description ,
    required String title
  }) async{
    emit(UploadVideoLoadingState());
    try{
      final response = await httpConsumer.post(
        data: {
          "url": videoUrl,
          "title": title,
          "description":  description
        },
        baseUrl: EndPoint.uploadVideo,
        headers:{
          "Content-Type": "application/json",
          "token":"@V*ice_Verse$token"
        },
      );
      if (response.statusCode == 200) {
        emit(UploadVideoSuccessState());
      }
      else {
        UploadVideoFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]);
      }
    }catch(e){
      UploadVideoFailureState(e.toString());
    }
  }
}

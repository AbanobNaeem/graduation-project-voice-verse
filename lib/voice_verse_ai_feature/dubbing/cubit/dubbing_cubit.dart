import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
part 'dubbing_state.dart';

class DubbingCubit extends Cubit<DubbingStates> {
  DubbingCubit() : super(DubbingInitialState());
  final HttpConsumer httpConsumer = HttpConsumer();
  final String? token = PreferenceUtils.instance.getString(ApiKey.token);
  Future<void> dubbing({
    required String title ,
    required String description,
    required String videoUrl
  }) async {
    emit(DubbingLoadingState());
    try {
      final response = await httpConsumer.post(
        headers: {
          "Content-Type": "application/json",
          "token":"@V*ice_Verse$token"
        },
        data: {
          "description": description,
          "title": title,
          "original_video": videoUrl
        },
        baseUrl: EndPoint.aiDubbing,
      );
      if (response.statusCode == 200) {
        emit(DubbingSuccessState());
        print(response.body);
      } else {
        emit(DubbingFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }
    } catch (e) {
      emit(DubbingFailureState("dubbing error please try again"));
    }
  }

}

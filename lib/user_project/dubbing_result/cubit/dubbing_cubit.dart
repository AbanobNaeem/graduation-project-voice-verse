import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
import 'package:voice_verse/models/dubbing_model.dart';

part 'dubbing_state.dart';

class DubbingCubit extends Cubit<DubbingStates> {
  HttpConsumer httpConsumer = HttpConsumer();
  final String? token = PreferenceUtils.instance.getString(ApiKey.token);

  DubbingCubit() : super(DubbingInitialState());



  Future<void> getDubbingOutPut() async {
    try {
      emit(GetDubbingOutPutLoadingState());
      final response = await httpConsumer.get(
        EndPoint.getDubbingOutPut,
        headers: {"token": "@V*ice_Verse$token"},
      );
      emit(GetDubbingOutPutSuccessState(DubbingModel.fromJson(response)));
    }catch(error){
      emit(GetDubbingOutPutFailureState(error.toString()));
    }
  }
}

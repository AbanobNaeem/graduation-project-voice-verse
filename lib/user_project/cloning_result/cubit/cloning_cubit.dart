import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
import 'package:voice_verse/models/cloning_model.dart';

part 'cloning_state.dart';

class CloningCubit extends Cubit<CloningStates> {
  HttpConsumer httpConsumer = HttpConsumer();
  final String? token = PreferenceUtils.instance.getString(ApiKey.token);
  CloningCubit() : super(CloningInitialState());


  Future<void> getCloningOutPut() async {
    try {
      emit(GetCloningOutPutLoadingState());
      final response = await httpConsumer.get(
        EndPoint.getCloningOutPut,
        headers: {"token": "@V*ice_Verse$token"},
      );
      emit(GetCloningOutPutSuccessState(CloningModel.fromJson(response)));
    }catch(error){
      emit(GetCloningOutPutFailureState(error.toString()));
    }
  }

}

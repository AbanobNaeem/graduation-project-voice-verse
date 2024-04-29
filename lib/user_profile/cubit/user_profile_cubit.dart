
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
import 'package:voice_verse/models/user_data_model.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileStates> {
  UserProfileCubit() : super(UserProfileInitialState());
  HttpConsumer httpConsumer = HttpConsumer();

  final String? token = PreferenceUtils.instance.getString(ApiKey.token);

 Future<void> getUserData() async {
    try {
      emit(GetDataLoadingState());
      final response = await httpConsumer.get(
        EndPoint.getUserData,
        headers: {"token": "@V*ice_Verse$token"},
      );
      emit(GetDataSuccessState(UserDataModel.fromJson(response)));
    }catch(e){
      emit(GetDataFailureState(e.toString()));
    }

  }

  Future<void> logOut() async {
    if (token != null) {
      try {
        await httpConsumer.get(
          EndPoint.logOut,
          headers: {"token": "@V*ice_Verse$token"},
        );
        PreferenceUtils.instance.remove("token");
        emit(LogOutSuccessState());
      } catch (error) {
        LogOutFailureState(error.toString());
      }
    }
  }

  Future<void> deleteAccount() async {
    if (token != null) {
      try {
        await httpConsumer.delete(
          baseUrl: EndPoint.deleteAccount,
          headers: {"token": "@V*ice_Verse$token"},
        );
        PreferenceUtils.instance.clear();
        emit(DeleteAccountSuccessState());
      } catch (error) {
        DeleteAccountFailureState(error.toString());
      }
    }
  }
}



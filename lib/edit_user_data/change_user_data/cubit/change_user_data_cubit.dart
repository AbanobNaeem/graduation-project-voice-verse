import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';

part 'change_user_data_state.dart';

class ChangeUserDataCubit extends Cubit<ChangeUserDataStates> {
  ChangeUserDataCubit() : super(ChangeUserDataInitialState());
  String? token = PreferenceUtils.instance.getString(ApiKey.token);
  HttpConsumer httpConsumer = HttpConsumer();


  Future<void>changePassword({
    required String currentPassword ,
    required String newPassword ,
    required String confirmPassword
}) async{
    emit(ChangePasswordLoadingState());
    try {
      final response = await httpConsumer.patch(
        headers: {
          "token":"@V*ice_Verse$token",
          "Content-Type": "application/json",
        },
        data: {
          "oldPassword": currentPassword,
          "newPassword": newPassword,
          "cPassword":  confirmPassword
        },
        baseUrl:EndPoint.changePassword
      );
      if (response.statusCode == 200) {
        emit(ChangePasswordSuccessState());
      } else {
        emit(ChangePasswordFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }

    } catch (e) {
      emit(ChangePasswordFailureState("An error occurred"));
    }
  }


  Future<void>changeUserName({
    required String newName,
  }) async{
    emit(ChangeNameLoadingState());
    try {
      final response = await httpConsumer.patch(
          headers: {
            "token":"@V*ice_Verse$token",
            "Content-Type": "application/json",
          },
          data: {
            "userName": newName
          },
          baseUrl:EndPoint.changeName
      );
      if (response.statusCode == 200) {
        emit(ChangeNameSuccessState());
      } else {
        emit(ChangeNameFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }

    } catch (e) {
      emit(ChangeNameFailureState("An error occurred"));
    }
  }



}

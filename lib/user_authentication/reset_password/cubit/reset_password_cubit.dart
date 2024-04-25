import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitialState());
  HttpConsumer httpConsumer = HttpConsumer() ;

  Future<void> resetPassword({
    required String code ,
    required String password,
    required String confirmPassword

  }) async {
    emit(ResetPasswordLoadingState());
    try {
      final response = await httpConsumer.patch(
        headers: {"Content-Type": "application/json"},
        data: {
          "forgetCode": code,
          "password": password,
          "cPassword": confirmPassword
        },
        baseUrl: EndPoint.resetPassword,
      );
      if (response.statusCode == 200) {
        emit(ResetPasswordSuccessState(httpConsumer.parsResponse(response)[ApiKey.message]));
      } else {
        emit(ResetPasswordFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }

    } catch (e) {
      emit(ResetPasswordFailureState("An error occurred"));
    }
  }
}

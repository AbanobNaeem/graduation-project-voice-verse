import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';

import '../../../data_source/core/API/end_points.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationStates> {
  EmailVerificationCubit() : super(EmailVerificationInitialState());

  HttpConsumer httpConsumer = HttpConsumer();

  Future<void> checkCode({
    required String code,
  }) async {
    emit(CheckCodeLoadingState());
    try {
      final response = await httpConsumer.post(
        headers: {"Content-Type": "application/json"},
        data: {"forgetCode": code},
        baseUrl: EndPoint.checkCode,
      );
      if (response.statusCode == 200) {
        emit(CodeTrueState());
      } else {
        emit(CodeFalseState(
            httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }
    } catch (e) {
      emit(CodeFalseState("An error occurred"));
    }
  }


  Future<void> reSendCode({
    required String email ,

  }) async {
    try {
      final response = await httpConsumer.patch(
        headers: {"Content-Type": "application/json"},
        data: {
          "email": email,
        },
        baseUrl: EndPoint.sendCode,
      );
      if (response.statusCode == 200) {
        emit(ReSendCodeSuccessState());
      } else {
        emit(ReSendCodeFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }

    } catch (e) {
      emit(ReSendCodeFailureState("An error occurred"));
    }
  }


}

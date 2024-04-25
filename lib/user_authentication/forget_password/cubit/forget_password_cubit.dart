import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(ForgetPasswordInitialState());

  HttpConsumer httpConsumer = HttpConsumer() ;

  Future<void> sendCode({
    required String email ,

  }) async {
    emit(SendCodeLoadingState());
    try {
      final response = await httpConsumer.patch(
        headers: {"Content-Type": "application/json"},
        data: {
          "email": email,
        },
        baseUrl: EndPoint.sendCode,
      );
      if (response.statusCode == 200) {
        emit(SendCodeSuccessState());
      } else {
        emit(SendCodeFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }

    } catch (e) {
      emit(SendCodeFailureState("An error occurred"));
    }
  }
}

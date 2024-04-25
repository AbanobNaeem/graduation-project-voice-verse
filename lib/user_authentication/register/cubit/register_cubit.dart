import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
part 'register_state.dart';


class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  final HttpConsumer httpConsumer = HttpConsumer();
  Future<void> register({
    required String userName,
    required String email ,
    required String password,
    required String confirmPassword

  }) async {
    emit(RegisterLoadingState());
    try {
      final response = await httpConsumer.post(
        headers: {"Content-Type": "application/json"},
        data: {
          "userName": userName,
          "email": email,
          "password": password,
          "cPassword": confirmPassword
        },
        baseUrl:EndPoint.register,
      );
      if (response.statusCode == 200) {
        emit(RegisterSuccessState());
      } else {
        emit(RegisterFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }
    } catch (e) {
      emit(RegisterFailureState("An error occurred"));
    }
  }



}

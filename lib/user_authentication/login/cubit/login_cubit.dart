import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
part 'login_state.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  final HttpConsumer httpConsumer = HttpConsumer();

  Future<void> login({
    required String email ,
    required String password
}) async {
    emit(LoginLoadingState());
    try {
      final response = await httpConsumer.post(
        data: {
          "email": email,
          "password": password,
        },
        baseUrl: EndPoint.baseUrl + EndPoint.login,
      );
      if (response.statusCode == 200) {
        await _saveUserData(httpConsumer.parsResponse(response));
        emit(LoginSuccessState(httpConsumer.parsResponse(response)[ApiKey.token]));
      } else {
        emit(LoginFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }
    } catch (e) {
      emit(LoginFailureState("An error occurred"));
    }
  }

  Future<void> _saveUserData(data) async {
    await PreferenceUtils.instance.setString(ApiKey.token, data[ApiKey.token]);
  }
}


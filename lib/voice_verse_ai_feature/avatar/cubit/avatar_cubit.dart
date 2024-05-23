import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';

part 'avatar_state.dart';

class AvatarCubit extends Cubit<AvatarStates> {
  AvatarCubit() : super(AvatarInitialState());

  HttpConsumer httpConsumer = HttpConsumer();
  final String? token = PreferenceUtils.instance.getString(ApiKey.token);

  Future<void> cloning({
    required String textToSpeech,
    required String title,
    required File audioFile,
  }) async {
    emit(AvatarLoadingState());
    try {
      var request = http.MultipartRequest('POST', Uri.parse(EndPoint.aiCloning))
        ..files.add(await http.MultipartFile.fromPath(
          'audio_file',
          audioFile.path,
          contentType: MediaType('audio','wave'), // Specify MIME type for WAV file
        ))
        ..fields['textToSpeech'] = textToSpeech
        ..fields['title'] = title
        ..headers['token'] = "@V*ice_Verse$token";

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        emit(AvatarSuccessState());
      } else {
        emit(AvatarFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }
    } catch (e) {
      emit(AvatarFailureState("Avatar error, please try again"));

    }
  }
}

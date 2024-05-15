import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';

part 'upload_video_state.dart';

class UploadVideoCubit extends Cubit<UploadVideoStates> {
  UploadVideoCubit() : super(UploadVideoInitialState());
  HttpConsumer httpConsumer = HttpConsumer();
  final String? token = PreferenceUtils.instance.getString(ApiKey.token);

  Future<void> uploadVideo({
    required File videoFile,
    required String description,
    required String title,
  }) async {
    emit(UploadVideoLoadingState());
    try {
      var request = http.MultipartRequest('POST', Uri.parse(EndPoint.uploadVideo))
        ..files.add(await http.MultipartFile.fromPath(
          'video',
          videoFile.path,
          contentType: MediaType('video', 'mp4'),
        ))
        ..fields['title'] = title
        ..fields['description'] = description
        ..headers['token'] = "@V*ice_Verse$token";

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        emit(UploadVideoSuccessState());
      } else {
        emit(UploadVideoFailureState(httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }
    } catch (e) {
      emit(UploadVideoFailureState(e.toString()));
    }
  }

  bool isMp4File(String url) {
    return url.toLowerCase().endsWith('.mp4');
  }
}

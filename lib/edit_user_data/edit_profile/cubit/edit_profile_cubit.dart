import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:voice_verse/data_source/core/API/end_points.dart';
import 'package:voice_verse/data_source/core/API/http_consumer.dart';
import 'package:voice_verse/data_source/local/preference_utils.dart';
import 'package:http/http.dart' as http;
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit() : super(EditProfileInitialState());

  String? token = PreferenceUtils.instance.getString(ApiKey.token);
  HttpConsumer httpConsumer = HttpConsumer();

  Future<void> changeUserImage({
    required File image,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(EndPoint.changeUserImage),);
      request.headers['token'] = "@V*ice_Verse$token";
      request.files.add(http.MultipartFile(
        'image',
        image.readAsBytes().asStream(),
        image.lengthSync(),
        filename: image.path.split('/').last,
        contentType: MediaType('image', 'jpeg'), // Default to 'image/jpeg'
      ));

      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        emit(UserProfileUploadSuccess());
      } else {
        emit(UserProfileUploadFailure(
            httpConsumer.parsResponse(response)[ApiKey.errorMessage]));
      }
    } catch (e) {
      emit(UserProfileUploadFailure(e.toString()));
    }
  }
}

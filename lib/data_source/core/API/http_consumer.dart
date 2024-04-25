import 'dart:convert';
import 'package:http/http.dart' as http;


class HttpConsumer {
  Future<http.Response> post ({
    required Map<String, dynamic> data ,
    required String baseUrl,
    required Map<String, String>? headers
  })async{
    try{
      final response = await http.post(Uri.parse(baseUrl),
          headers: headers,
          body:jsonEncode(data)
      );
      return response ;
    }catch(error){
      rethrow ;
    }
  }
 Map parsResponse (http.Response response ){
    return jsonDecode(
      response.body
    );
  }

  Future<Map> get(String baseUrl, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );
      return jsonDecode(response.body);
    } catch (error) {
      rethrow;
    }
  }

  Future<http.Response> delete({
        required Map<String, String> headers,
        required String baseUrl,
        Map<String, dynamic>? data ,
      }
      ) async {
    try {
      final response = await http.delete(
          Uri.parse(baseUrl),
          headers: headers,
          body:jsonEncode(data)
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<http.Response> patch({
    required Map<String, dynamic> data,
    required String baseUrl,
    Map<String, String>? headers
  }) async {
    try {
      final response = await http.patch(
        Uri.parse(baseUrl),
        headers: headers,
        body: jsonEncode(data),
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }


}

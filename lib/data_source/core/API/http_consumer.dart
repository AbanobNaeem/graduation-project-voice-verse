import 'dart:convert';
import 'package:http/http.dart' as http;


class HttpConsumer {
  Future<http.Response> post ({
    required Map<String, dynamic> data ,
    required String baseUrl
  })async{
    try{
      final response = await http.post(Uri.parse(baseUrl),
          headers: {"Content-Type": "application/json"},
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
}
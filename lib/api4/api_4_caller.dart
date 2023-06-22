import 'dart:convert';
import 'package:http/http.dart' as h;
import 'package:http/http.dart';
import 'api_4_user_model.dart';

Future<Api4UserModel?>  api4Caller() async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
  try {
    Response reaponse = await h.get(url);
    if (reaponse.statusCode == 200) {
      final body = reaponse.body;
      final res = jsonDecode(body);
      final result = Api4UserModel.fromJson(res);
      return result;
    }
  else {
  return null;
  }
  } catch (e) {


  return null;
  }
}

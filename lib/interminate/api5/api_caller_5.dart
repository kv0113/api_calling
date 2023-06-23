import 'dart:convert';

import 'package:http/http.dart' as h;
import 'package:http/http.dart';

import 'api_model_5.dart';

Future<List<Api5UserModel>?> api5Caller() async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/todos");
  try {
    Response reaponse = await h.get(url);
    if (reaponse.statusCode == 200) {
      final body = reaponse.body;
      final list = jsonDecode(body);
      final result = List<Api5UserModel>.from(list.map((e) => Api5UserModel.fromJson(e)));
      return result;
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


Future<Map<String, dynamic>?> api3Caller() async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/users/1");

  try {


    Response response = await http.get(url);
    print('statusCode : ${response.statusCode}');
    if (response.statusCode == 200) {

      print('body : ${response.body}');
      final body = response.body;
      final result = jsonDecode(body);

      return result;
    } else {
      return null;
    }
  } catch (error) {
    print('error : $error');
    return null;
  }
}
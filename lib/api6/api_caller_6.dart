import 'dart:developer';

import 'package:dio/dio.dart';

import 'api_user_model_6.dart';

Future<List<Api6UserModel>> api6Caller() async {
  final dio = Dio();
  const uri = "https://jsonplaceholder.typicode.com/users";

  try {
    Response response = await dio.get(uri);

    // log('statusCode : ${response.statusCode}');
    // log('body : ${response.data}');

    if (response.statusCode == 200) {
      final List list = response.data;
      final result = List<Api6UserModel>.from(list.map((e) => Api6UserModel.fromJson(e)));
      return result;
    } else {
      return [];
    }
  } on DioException catch (e) {
    log('dioCatchError : $e');
    return [];
  } catch (e) {
    log('catchError : $e');
    return [];
  }
}

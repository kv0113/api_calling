import 'package:apicalling/advanced/api7/service_class.dart';
import 'package:apicalling/advanced/responceclass.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ServiceProvider extends ChangeNotifier {
  final dio = Dio();
  bool isLoadingForService = true;

  Future<Responceclass<List<ServiceClass>>> readSevice() async {
    const uri = "https://garage.logispire.in/api/service/garage/1";
    Responceclass<List<ServiceClass>> responseClass = Responceclass(
      message: "Api is calling",
      success: false,
    );
    try {

      isLoadingForService = true;
      notifyListeners();
      Response response = await dio.get(
        uri,
        options: Options(
          validateStatus: (status) {
            return status == 200 ||
                status == 400 ||
                status == 404 ||
                status == 500;
          },
        ),
      );
      if (response.statusCode == 200) {
        responseClass.success = true;
        responseClass.message = response.data['msg'];
        responseClass.data = List<ServiceClass>.from(response.data['data'].map((e)=> ServiceClass.fromJson(e)));


        isLoadingForService = false;
        notifyListeners();
        return responseClass;
      } else {
        responseClass.success = false;
        responseClass.message = "Something Went Wrong";
        isLoadingForService = false;
        notifyListeners();
        return responseClass;
      }
    } on DioException catch (e) {
      debugPrint('DiocatchException : $e');
      isLoadingForService = false;
      notifyListeners();
      return responseClass;
    } catch (e) {
      debugPrint('catchError : $e');
      isLoadingForService = false;
      notifyListeners();
      return responseClass;
    }
  }
}

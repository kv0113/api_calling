import 'package:apicalling/api5/api_ui_5.dart';
import 'package:flutter/material.dart';

import 'api_caller_5.dart';
import 'api_model_5.dart';
//list of map in factory

class Api5Home extends StatefulWidget {
  const Api5Home({Key? key}) : super(key: key);

  @override
  State<Api5Home> createState() => _Api5HomeState();
}

class _Api5HomeState extends State<Api5Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api 4")),
      body: FutureBuilder(
        future: api5Caller(),
        builder: (context, AsyncSnapshot<List<Api5UserModel>?> snapshot) {
          if (snapshot.hasData) {
            return Api5Ui(users: snapshot.data!,);
          } else if (snapshot.hasError) {
            return Text("YourApiError : ${snapshot.error}");
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

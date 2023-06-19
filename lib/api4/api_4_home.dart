import 'package:flutter/material.dart';

import 'api_4_caller.dart';
import 'api_4_ui.dart';
import 'api_4_user_model.dart';

class Api4Home extends StatefulWidget {
  const Api4Home({Key? key}) : super(key: key);

  @override
  State<Api4Home> createState() => _Api4HomeState();
}

class _Api4HomeState extends State<Api4Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      api4Caller();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api 4")),
      body: FutureBuilder(
        future: api4Caller(),
        builder: (context, AsyncSnapshot<Api4UserModel?> snapshot) {
          if (snapshot.hasData) {
            return Api4Ui(user: snapshot.data,);
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

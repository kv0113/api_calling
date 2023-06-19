import 'package:flutter/material.dart';

import 'api_4_user_model.dart';

class Api4Ui extends StatelessWidget {
  final Api4UserModel? user;

  const Api4Ui({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return user != null
        ? Column(
            children: [
              Text("id : ${user!.id}"),
              Text("userid : ${user!.userid}"),
              Text("title : ${user!.title}"),
              Text("completed : ${user!.completed}"),

            ],
          )
        : Text("YourApiHasProblem");
  }
}

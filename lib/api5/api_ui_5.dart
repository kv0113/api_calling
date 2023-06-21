import 'package:flutter/material.dart';

import 'api_model_5.dart';

class Api5Ui extends StatelessWidget {
  final List<Api5UserModel> users;

  const Api5Ui({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return users != null
        ? ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users.elementAt(index);
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("id: ${user.id}"),
                    Text("userId: ${user.userid}"),
                    Text("title: ${user.title}"),
                    Text("completed: ${user.completed}"),


                    // Text("id : ${users.elementAt(index)['id']}"),
                    // Text("userId ${users.elementAt(index)['userId']}"),
                    // Text("title : ${users.elementAt(index)['title']}"),
                    // Text("completed : ${users.elementAt(index)['completed']}"),
                  ],
                ),
              );
            },
          )
        : Text("YourApiHasProblem");
  }
}

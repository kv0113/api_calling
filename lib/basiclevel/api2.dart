import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart';

class APICalling2 extends StatefulWidget {
  const APICalling2({super.key});

  @override
  State<APICalling2> createState() => _APICalling2State();
}

class _APICalling2State extends State<APICalling2> {
  @override
  void initState() {
    api2Calling();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API-2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: api2Calling(),
          builder:
              (context, AsyncSnapshot<List<Map<String, dynamic>>?> snapshot) {
            if (snapshot.hasData) {
              return API2UI(
                users: snapshot.data!,
              );
            } else if (snapshot.hasError) {
              return Text('Error : ${snapshot.error}');
            } else {
              return const LinearProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

Future<List<Map<String, dynamic>>?> api2Calling() async {
  final Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/todos");
  try {
    Response response = await get(uri);
    debugPrint('statusCode : ${response.statusCode}');
    debugPrint('headers : ${response.headers}');
    // debugPrint('body : ${response.body}');
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body);
      debugPrint('list -> ${list.runtimeType}');
      final res = List<Map<String, dynamic>>.from(list);
      debugPrint('res -> ${res.runtimeType}');
      return res;
    } else {
      return null;
    }
  } catch (e) {
    debugPrint("CatchError : $e");
    return null;
  }
}

/*
200 -> Get -> success,patch,delete,put
201 -> post -> host/send
403 -> server/method
404 -> bad request
409 -> duplicasy
500 -> internal server error
*/

class API2UI extends StatelessWidget {
  final List<Map<String, dynamic>> users;
  const API2UI({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users.elementAt(index);
        return Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("id : ${user['id']}"),
              Text("userId ${user['userId']}"),
              Text("title : ${user['title']}"),
              Text("completed : ${user['completed']}"),

              // Text("id : ${users.elementAt(index)['id']}"),
              // Text("userId ${users.elementAt(index)['userId']}"),
              // Text("title : ${users.elementAt(index)['title']}"),
              // Text("completed : ${users.elementAt(index)['completed']}"),
            ],
          ),
        );
      },
    );
  }
}
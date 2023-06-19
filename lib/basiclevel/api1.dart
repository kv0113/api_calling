import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class APICalling1 extends StatelessWidget {
  const APICalling1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API-1"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("API-1"),
            ),
            const SizedBox(height: 20),
            FutureBuilder(
              future: api1Calling(),
              builder:
                  (context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ID : ${snapshot.data!["id"]}"),
                        Text("User-ID : ${snapshot.data!["userId"]}"),
                        Text("Title : ${snapshot.data!["title"]}"),
                        Text("Completed : ${snapshot.data!["completed"]}"),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  throw Exception("Error : ${snapshot.error}");
                } else {
                  return const CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>?> api1Calling() async {
  final url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
  try {
    Response response = await http.get(url);
    log("statusCode : ${response.statusCode}");
    log("body : ${response.body}");
    log("body : ${response.body.runtimeType}");
    if (response.statusCode == 200) {
      final Map<String, dynamic> result = json.decode(response.body);
      return result;
    } else {
      return null;
    }
  } catch (e) {
    log('API-1 Error : $e');
    return null;
  }
}

import 'package:flutter/material.dart';

class API3UI extends StatelessWidget {
  final Map<String, dynamic>? user;
  const API3UI({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return user != null
        ? Container(
      width: double.maxFinite,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("ID : ${user!["id"]}"),
          Text("Name : ${user!["name"]}"),
          Text("Email : ${user!["email"]}"),
          Text("Phone : ${user!["phone"]}"),
          Text("Website : ${user!["website"]}"),
          const SizedBox(height: 10),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,

                child: SizedBox(
                  height: 120,
                  width: 300,

                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Company"),
                        Text("Name : ${user!['company']['name']}"),
                        Text("Phrase : ${user!['company']['catchPhrase']}"),
                        Text("Bs : ${user!['company']['bs']}"),
                      ],
                    ),
                  ),
                ),
              ),          const SizedBox(height: 15),

              SingleChildScrollView(
                scrollDirection: Axis.vertical,

                child: SizedBox(
                  height: 120,
                  width: 300,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Address"),
                        Text("Street : ${user!['address']['street']}"),
                        Text("City : ${user!['address']['city']}"),
                        Text("Zipcode : ${user!['address']['zipcode']}"),
                        const Text("Landmark"),
                        Text(
                            "Latitute : ${user!['address']['geo']['lat']}"),
                        Text(
                            "Longitude : ${user!['address']['geo']['lng']}"),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

            ],
          ),
        ],
      ),
    )
        : const Center(child: Text("SomethingWentSwong"));
  }
}
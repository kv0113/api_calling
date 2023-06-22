import 'package:flutter/material.dart';

import 'api_user_model_6.dart';

class API6UI extends StatelessWidget {
  final List<Api6UserModel> users;

  const API6UI({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final Api6UserModel user = users.elementAt(index);
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.purple.shade50,
              border: Border.all(
                color: Colors.purple.shade300,
                width: 0.25,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID : ${user.id}"),
                Text("UserName : ${user.userName}"),
                Text("Name : ${user.name}"),
                Text("Email : ${user.email}"),
                Text("Mobile : ${user.phone}"),
                Text("URL : ${user.website}"),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.purple.shade100,
                    border: Border.all(
                      color: Colors.purple.shade400,
                      width: 0.25,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("User Company Details"),
                      Text("Name : ${user.company.name}"),
                      Text("catchPhrase : ${user.company.catchPhrase}"),
                      Text("BS : ${user.company.bs}"),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.purple.shade100,
                    border: Border.all(
                      color: Colors.purple.shade400,
                      width: 0.25,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Address"),
                      Text("Street : ${user.address.street}"),
                      Text("Suite : ${user.address.suite}"),
                      Text("City : ${user.address.city}"),
                      Text("Pincode : ${user.address.zipcode}"),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.purple.shade100,
                          border: Border.all(
                            color: Colors.purple.shade400,
                            width: 0.25,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Geo"),
                            Text("lat : ${user.address.geo.lng}"),
                            Text("lng : ${user.address.geo.lng}"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'advanced/api7/Api7home.dart';
import 'advanced/api7/sevice_provider.dart';
import 'basiclevel/api1.dart';
import 'basiclevel/api2.dart';
import 'helperfunction/my_navigation.dart';
import 'interminate/api3/api3_home.dart';
import 'interminate/api4/api_4_home.dart';
import 'interminate/api5/api_home_5.dart';
import 'interminate/api6/api_home_6.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ServiceProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'API',
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.purple.shade500),
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.purple.shade300,
            elevation: 0.0,
            centerTitle: true,
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Calling"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                nextScreen(
                  context,
                  const APICalling1(),
                );
              },
              child: const Text("API-1"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                nextScreen(
                  context,
                  const APICalling2(),
                );
              },
              child: const Text("API-2"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                nextScreen(
                  context,
                  const API3Home(),
                );
              },
              child: const Text("API-3"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                nextScreen(context, Api4Home());
              },
              child: Text("Api 4"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                nextScreen(context, Api5Home());
              },
              child: Text("Api 5"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                nextScreen(context, API6Home());
              },
              child: Text("Api 6"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                nextScreen(context, Api7Home());
              },
              child: Text("Api 7"),
            ),
          ],
        ),
      ),
    );
  }
}



import 'package:apicalling/advanced/api7/sevice_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api7ui.dart';

class Api7Home extends StatefulWidget {
  const Api7Home({Key? key}) : super(key: key);

  @override
  State<Api7Home> createState() => _Api7HomeState();
}

class _Api7HomeState extends State<Api7Home> {
  List<Map<String, dynamic>>? services;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ServiceProvider>().readSevice().then((value) {
        if (value.success && value.data != null) {
          services = List<Map<String, dynamic>>.from(value.data);
          setState(() {});
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ServiceProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Api 7"),
      ),
      body: provider.isLoadingForService
          ? CircularProgressIndicator()
          : services != null
              ? Api7Ui(services: services!,)
              : Text("skhdg"),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fodinha/history/view/history_view.dart';
import 'package:fodinha/home/view/home_view.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const Fodinha());
}

class Fodinha extends StatelessWidget {
  const Fodinha({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fodinha',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/', page: () => HomeView()),
        GetPage(name: '/history', page: () => HistoryView())
      ],
    );
  }
}

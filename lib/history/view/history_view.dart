import 'package:flutter/material.dart';
import 'package:fodinha/history/controller/history_controller.dart';
import 'package:get/get.dart';

class HistoryView extends StatelessWidget {
  final controller = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(22, 37, 46, 1),
      appBar: AppBar(
        title: const Text(
          'Histórico anti ladrão',
          style: TextStyle(
              fontFamily: 'Amatic',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 5),
        ),
        backgroundColor: const Color.fromRGBO(0, 124, 118, 1),
      ),
      body: ListView.builder(
        itemCount: controller.actions.length,
        itemBuilder: (context, index) {
          final action = controller.actions[index];
          return ListTile(
            title: Text(action.message, style: TextStyle(color: Colors.white)),
            trailing: Text(action.time, style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}

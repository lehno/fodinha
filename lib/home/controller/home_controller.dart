import 'package:flutter/material.dart';
import 'package:fodinha/history/controller/history_controller.dart';
import 'package:fodinha/home/model/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HistoryController history = Get.put(HistoryController());
  RxList<RxUser> users = List<RxUser>.from([]).obs;
  final userName = TextEditingController();

  addUser() {
    if (userName.text.isNotEmpty) {
      final user = RxUser(userName.text);
      users.add(user);
      history.addAction('${user.name} adicionado');
      userName.text = '';
      Get.back();
    }
  }

  removeUser(index) {
    history.addAction('${users[index].name} removido');
    users.removeAt(index);
  }

  addPoint(index) {
    users[index].score.value++;
    history.addAction('${users[index].name} foi troxa e tomo ponto');
  }

  removePoint(index) {
    if (users[index].score.value > 0) {
      users[index].score.value--;
      history
          .addAction('${users[index].name} foi injustiçado, remove um ponto');
    }
  }

  reset() {
    users.value.forEach((element) {
      element.score.value = 0;
    });
    history.reset();
    Get.back();
  }

  clear() {
    users.value = [];
    history.reset();
    Get.back();
  }

  @override
  void onClose() {
    userName.dispose();
    super.onClose();
  }
}

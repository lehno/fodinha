import 'package:flutter/material.dart';
import 'package:fodinha/home/model/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<RxUser> users = List<RxUser>.from([]).obs;
  final userName = TextEditingController();

  addUser() {
    if (userName.text.isNotEmpty) {
      final user = RxUser(userName.text);
      users.add(user);
      userName.text = '';
      Get.back();
    }
  }

  reset() {
    users.value.forEach((element) {
      element.score.value = 0;
    });
    Get.back();
  }

  clear() {
    users.value = [];
    Get.back();
  }

  @override
  void onClose() {
    userName.dispose();
    super.onClose();
  }
}

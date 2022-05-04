import 'package:fodinha/history/model/history_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryController extends GetxController {
  RxList<History> actions = List<History>.from([]).obs;

  addAction(message) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss').format(now);
    final history = History(message, formattedDate);
    actions.add(history);
  }

  reset() {
    actions.clear();
    Get.back();
  }
}

import 'package:flutter/material.dart';
import 'package:fodinha/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(22, 37, 46, 1),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(0, 124, 118, 1),
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                icon: const Icon(Icons.restore),
                color: Colors.white,
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('LIMPAR SCORE'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text('OPS, CANCELA'),
                      ),
                      TextButton(
                        onPressed: () => controller.reset(),
                        child: const Text('APAGA TUDO'),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                iconSize: 30.0,
                color: Colors.white,
                icon: const Icon(Icons.close),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('LIMPAR JOGADORES'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text('OPS, CANCELA'),
                      ),
                      TextButton(
                        onPressed: () => controller.clear(),
                        child: const Text('REMOVE GERAL'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 100.0,
        width: 100.0,
        child: FittedBox(
          child: FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Adicione um novo perdedor!'),
                        content: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          child: TextField(
                            controller: controller.userName,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Nome',
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                              child: const Text('DEIXE QUIETO'),
                              onPressed: () => Get.back()),
                          TextButton(
                            child: const Text('ADICIONAR'),
                            onPressed: () => controller.addUser(),
                          )
                        ],
                      );
                    });
              },
              backgroundColor: const Color.fromRGBO(0, 124, 118, 1),
              child: const Icon(Icons.person_add)),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'FODINHA',
          style: TextStyle(
              fontFamily: 'Amatic',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 10),
        ),
        backgroundColor: const Color.fromRGBO(0, 124, 118, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: Obx(
          () => controller.users.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Add a galera pra iniciar!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Amatic',
                          letterSpacing: 8),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: controller.users.length,
                  itemBuilder: (context, index) {
                    final item = controller.users[index];
                    return Dismissible(
                      key: Key(item.name),
                      onDismissed: (direction) {
                        controller.users.removeAt(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${item.name} eliminado')));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 10),
                        child: ListTile(
                          leading: Obx(
                            () => Text(
                              controller.users[index].score.toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30.0),
                            ),
                          ),
                          title: Text(
                            controller.users[index].name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24.0),
                          ),
                          trailing: Wrap(
                            spacing: 20,
                            children: [
                              IconButton(
                                iconSize: 30.0,
                                icon: const Icon(Icons.remove),
                                color: Colors.white,
                                onPressed: () {
                                  if (controller.users[index].score.value > 0) {
                                    controller.users[index].score.value--;
                                  }
                                },
                              ),
                              IconButton(
                                iconSize: 30.0,
                                color: Colors.white,
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  controller.users[index].score.value++;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

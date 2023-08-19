import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_model.dart';

class GetxHomePage extends StatefulWidget {
  const GetxHomePage({super.key});

  @override
  State<GetxHomePage> createState() => _GetxHomePageState();
}

class _GetxHomePageState extends State<GetxHomePage> {
  @override
  Widget build(BuildContext context) {
    final c = Get.put(DataGetItemMethods());
    print('rebuild');
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return ListView.builder(
              itemCount: c.item.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        c.item[index].id.toString(),
                      ),
                    ),
                    title: Text(
                      c.item[index].name.toString(),
                    ),
                    subtitle: Text(
                      c.item[index].email.toString(),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          c.addItem();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

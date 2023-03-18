import 'package:flutter/material.dart';

class AddTransection extends StatelessWidget {
  static const routeName = '/addTransection';
  const AddTransection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final amountController = TextEditingController();
    return Container(
      width: double.infinity,
      height: 200,
      color: const Color.fromARGB(255, 21, 241, 29),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              label: Text('Name'),
            ),
          ),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(
              label: Text('Amount'),
            ),
          ),
        ],
      ),
    );
  }
}

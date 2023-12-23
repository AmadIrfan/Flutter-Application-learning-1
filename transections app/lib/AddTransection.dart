// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransection extends StatefulWidget {
  final Function addTransection;
  const AddTransection({super.key, required this.addTransection});
  @override
  State<AddTransection> createState() => _AddTransectionState();
}

class _AddTransectionState extends State<AddTransection> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final focusAmount = FocusNode();
  final focusdate = FocusNode();
  final focusButton = FocusNode();
  DateTime? dateTime;
  void _addTransectioninList() {
    final title = titleController.text;
    final amount = priceController.text;
    if (title.isEmpty || amount.isEmpty || dateTime == null) {
      return;
    } else {
      widget.addTransection(title, double.parse(amount), dateTime);
      Navigator.of(context).pop();
    }
  }

  void _selectDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        dateTime = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 50),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (_) => _addTransectioninList(),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: priceController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Price'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dateTime == null
                        ? 'no Date Selected '
                        : DateFormat.yMEd().format(dateTime!),
                    style: const TextStyle(fontSize: 20),
                  ),
                  TextButton(
                    onPressed: () {
                      _selectDate();
                    },
                    child: const Text(
                      'select Date',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    _addTransectioninList();
                  },
                  child: const Text('Add Transection')),
            ],
          ),
        ),
      ),
    );
  }
}

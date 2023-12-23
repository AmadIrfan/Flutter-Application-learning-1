import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function addTransactions;
  const NewTransactions({Key? key, required this.addTransactions})
      : super(key: key);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final txAmount = TextEditingController();
  final txTitle = TextEditingController();
  DateTime? _isDate;

  void _ShowDatePicker(context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          _isDate = value;
        });
      }
    });
  }

  void onSubmit() {
    if (txAmount.text.isEmpty || txTitle.text.isEmpty || _isDate == null) {
      return;
    } else {
      widget.addTransactions(
          txTitle.text, double.parse(txAmount.text), _isDate);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: txTitle,
              decoration: const InputDecoration(
                label: Text("Title"),
              ),
            ),
            TextField(
              controller: txAmount,
              decoration: const InputDecoration(
                label: Text("Amount"),
              ),
            ),
            Row(
              children: [
                Text(_isDate == Null
                    ? 'Selected Date is : ${DateFormat.yMEd().format(_isDate!)}'
                    : 'No Date Selected'),
                TextButton(
                    onPressed: () => _ShowDatePicker(context),
                    child: const Text('Pick Date!! '))
              ],
            ),
            ElevatedButton(
                onPressed: () => onSubmit(),
                child: const Text('Add Transactions'))
          ],
        ),
      ),
    );
  }
}

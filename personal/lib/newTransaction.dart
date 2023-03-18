import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class newTransaction extends StatefulWidget {
  final Function onHand;
  newTransaction(this.onHand);

  @override
  State<newTransaction> createState() => _newTransactionState();
}

class _newTransactionState extends State<newTransaction> {
  final txtitle = TextEditingController();
  final txAmount = TextEditingController();
  DateTime? _pickedDate;
  void _datePicked() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          _pickedDate = value;
        });
      }
    });
   }

  void onSubmit() {
    String title = txtitle.text;
    String amount = txAmount.text;
    if (title.isEmpty || amount.isEmpty || _pickedDate == null) {
      return;
    } else if (title.isNotEmpty || amount.isNotEmpty || _pickedDate != null) {
      double amu = double.parse(txAmount.text);
      widget.onHand(title, amu, _pickedDate);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(
              controller: txtitle,
              decoration: InputDecoration(label: const Text('Title')),
            ),
            TextField(
              controller: txAmount,
              decoration: InputDecoration(label: const Text('Amount ')),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_pickedDate == null
                      ? 'No Date Picked '
                      : "Date Picked : ${DateFormat.yMd().format(_pickedDate!)}"),
                ),
                TextButton(onPressed: _datePicked, child: Text("Pick Date"))
              ],
            ),
            ElevatedButton(
                onPressed: onSubmit, child: const Text('Add Transactions '))
          ],
        ),
      ),
    );
  }
}

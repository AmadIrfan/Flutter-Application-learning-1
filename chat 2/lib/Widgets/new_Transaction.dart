// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _TxControl;

  NewTransaction(this._TxControl);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _TxTitle = TextEditingController();
  final _TxAmount = TextEditingController();
  DateTime? _PickedDate;

  void _onSubmit() {
    // ignore: non_constant_identifier_names
    final _TitalInput = _TxTitle.text;
    // ignore: non_constant_identifier_names
    final _AmountInput = _TxAmount.text;
    if (_AmountInput.isEmpty) return;
    if (_TitalInput.isEmpty || _AmountInput.isEmpty || _PickedDate == null) {
      return;
    } else {
      widget._TxControl(_TitalInput, double.parse(_AmountInput), _PickedDate);
      Navigator.of(context).pop();
    }
  }

  void _ShowDatePicker() {
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
          _PickedDate = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(
                  label: Text('Name', style: TextStyle(fontSize: 18)),
                ),
                controller: _TxTitle,
              ),
              TextField(
                decoration: const InputDecoration(
                    label: Text('Amount', style: TextStyle(fontSize: 18))),
                controller: _TxAmount,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _onSubmit,
              ),
              Container(
                height: 80,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Text(
                        _PickedDate == null
                            ? 'No Date Picked '
                            : 'Date Picked :${DateFormat.yMd().format(_PickedDate!)} ',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    TextButton(
                        onPressed: _ShowDatePicker,
                        child:
                            Text('pick Date ', style: TextStyle(fontSize: 18))),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: _onSubmit, child: Text('Add Transection '))
            ],
          ),
        ),
      ),
    );
  }
}

import './chart.dart';
import './NewTransactions.dart';
import 'Transaction.dart';
import 'package:flutter/material.dart';
import 'TransactionsList.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Personal Use',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions = [
    Transaction(
        id: DateTime.now().toString(),
        amount: 123.3,
        title: 'T1',
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        amount: 124.3,
        title: 'T2',
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        amount: 125.3,
        title: 'T3',
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        amount: 126.3,
        title: 'T4',
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        amount: 127.3,
        title: 'T5',
        date: DateTime.now()),
  ];
  List<Transaction> get _resentTransaction {
    return transactions.where((element) {
      return element.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _ShowTransactionsAddBar(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (dctx) {
          return GestureDetector(
            onTap: null,
            child: NewTransactions(addTransactions: _addTransactionIntoList),
          );
        });
  }

  void _addTransactionIntoList(String title, double amount, DateTime date) {
    final _newTransaction = Transaction(
        id: date.toString(), amount: amount, title: title, date: date);
    setState(() {
      transactions.add(_newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: const Text('Personal Uses'),
      actions: [
        IconButton(
            onPressed: () => _ShowTransactionsAddBar(context),
            icon: const Icon(Icons.add))
      ],
    );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height -
                      appbar.preferredSize.height -
                      MediaQuery.of(context).padding.bottom -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              child: Charts(transection: _resentTransaction),
            ),
            Container(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height -
                      appbar.preferredSize.height -
                      MediaQuery.of(context).padding.bottom -
                      MediaQuery.of(context).padding.top) *
                  0.7,
              child: TransactionList(transection: transactions),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _ShowTransactionsAddBar(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

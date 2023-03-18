import 'package:flutter/material.dart';
import 'TransectionList.dart';
import 'newTransaction.dart';
import 'Transaction.dart';
import 'chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Application ',
      theme: ThemeData(
        focusColor: Colors.white,
        fontFamily: 'Times',
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
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
  List<Transection> transaction = [];

  void _deleteTransaction(String id) {
    setState(() {
      transaction.removeWhere((element) => element.id == id);
    });
  }

  void _addNewTransections(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue,
        //    barrierColor: Colors.blue,
        context: context,
        builder: (dxontx) {
          return GestureDetector(
            onTap: () {},
            child: newTransaction(_addTransactionsToList),
          );
        });
  }

  void _addTransactionsToList(
      String title, double amount, DateTime selectedDate) {
    final Tx = Transection(
        id: DateTime.now().toString(),
        Title: title,
        Amount: amount,
        Date: selectedDate);
    setState(() {
      transaction.add(Tx);
    });
  }

  List<Transection> get _resentTransactions {
    return transaction.where((element) {
      return element.Date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Uses'),
        actions: [
          IconButton(
              onPressed: () => _addNewTransections(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: transaction.isEmpty
          ? Center(
              child: Card(
                  color: Colors.green,
                  child: Text(
                    'List is Empty ',
                    style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  )),
            )
          : Column(
              children: [
                charts(transaction: _resentTransactions),
                TransactionList(
                  transactions: transaction,
                  deleteTransaction: _deleteTransaction,
                ),
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNewTransections(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 50,
          semanticLabel: 'Add New Transaction',
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/Widgets/TransactionList.dart';
import 'package:flutter_application_4/Widgets/new_Transaction.dart';
import 'package:flutter_application_4/modal/Transaction.dart';
import '../Widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amad Irfan ',
      theme: ThemeData(
          primarySwatch: Colors.green,
          errorColor: Colors.red,
          // colorScheme: ColorScheme.light(secondary: Colors.amber),
          textTheme: ThemeData.light().textTheme.copyWith(
                  titleLarge: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ))),
      debugShowCheckedModeBanner: false,
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<Transactions> transections = [];
  bool _changeSwitch = false;
  List<Transactions> get _resentTransection {
    return transections.where((element) {
      return element.Date.isAfter(
          DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (dCtx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(addTransactions),
          );
        });
  }

  void addTransactions(String name, double amount, DateTime date) {
    final tx = Transactions(
        id: DateTime.now().toString(), title: name, Amount: amount, Date: date);
    setState(() {
      transections.add(tx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      transections.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appbar = AppBar(
      title: const Text('Amad Irfan '),
      actions: [
        IconButton(
          onPressed: () => _addnewTransaction(context),
          icon: const Icon(Icons.add),
          iconSize: 37,
        )
      ],
    );
    final _txListBar = Container(
      height: (MediaQuery.of(context).size.height -
              appbar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: TransectionList(
        transections: transections,
        deleteItem: _deleteTransaction,
      ),
    );

    return Scaffold(
        appBar: appbar,
        body: SingleChildScrollView(
          child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_isLandScape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Text('Show Chart'),
                    Switch(
                        value: _changeSwitch,
                        onChanged: (value) {
                          setState(() {
                            _changeSwitch = value;
                          });
                        })
                  ],
                ),
              if (!_isLandScape)
                Container(
                    height: (MediaQuery.of(context).size.height -
                            appbar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.3,
                    child: charts(_resentTransection)),
              if (!_isLandScape) _txListBar,
              if (_isLandScape)
                _changeSwitch
                    ? Container(
                        height: (MediaQuery.of(context).size.height -
                                appbar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.7,
                        child: charts(_resentTransection))
                    : _txListBar,
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Platform.isIOS
            ? Container()
            : FloatingActionButton(
                onPressed: () => _addnewTransaction(context),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 35,
                ),
              ));
  }
}

import 'package:flutter/material.dart';
import './AddTransection.dart';
import './TransectionList.dart';
import './chart.dart';
import './modal/Transection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Transections '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isChanged = false;
  List<Transection> tList = [];
  List<Transection> get _getResentDateList {
    return tList.where((element) {
      return element.dateTime!.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (dtx) {
          return AddTransection(addTransection: addTransectionintoList);
        });
  }

  void addTransectionintoList(String title, double amount, DateTime dateTime) {
    final transection = Transection(
        id: DateTime.now().toString(),
        title: title,
        dateTime: dateTime,
        amount: amount);
    setState(() {
      tList.add(transection);
    });
  }

  void deletItemFromList(String id) {
    setState(() {
      tList.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mood = MediaQuery.of(context).orientation == Orientation.landscape;
    final mDQuery = (MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top) -
        AppBar().preferredSize.height);
    final chartsShow = Container(
      // margin: const EdgeInsets.all(5),
      height: mDQuery * 0.35,
      decoration: BoxDecoration(
        border: Border.all(width: 3),
      ),
      child: Charts(
        tList: _getResentDateList,
      ),
    );

    final listW = tList.isNotEmpty
        ? Container(
            margin: const EdgeInsets.all(5),
            height: mDQuery * 0.54,
            child: TransectionList(
              deletItemFromList: deletItemFromList,
              tList: _getResentDateList,
            ),
          )
        : const Center(
            child: Text(
              'No Data Avalible',
              style: TextStyle(fontSize: 50),
            ),
          );
    final justText = Container(
      height: mDQuery * 0.08,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          'List of Transections :',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (mood)
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Show Charts',
                      style: TextStyle(fontSize: 40),
                    ),
                    Switch.adaptive(
                        value: isChanged,
                        onChanged: (value) {
                          setState(() {
                            isChanged = value;
                          });
                        })
                  ],
                ),
                if (isChanged)
                  Container(
                    // margin: const EdgeInsets.all(5),
                    height: mDQuery * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(width: 3),
                    ),
                    child: Charts(
                      tList: _getResentDateList,
                    ),
                  ),
                if (!isChanged)
                  Container(
                    height: mDQuery * 0.2,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'List of Transections :',
                        style: TextStyle(fontSize: 40),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                if (!isChanged)
                  tList.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.all(5),
                          height: mDQuery * 0.54,
                          child: TransectionList(
                            deletItemFromList: deletItemFromList,
                            tList: _getResentDateList,
                          ),
                        )
                      : const Center(
                          child: Text(
                            'No Data Avalible',
                            style: TextStyle(fontSize: 50),
                          ),
                        )
              ],
            ),
          if (!mood)
            Column(
              children: [
                chartsShow,
                justText,
                listW,
              ],
            ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModalBottomSheet(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

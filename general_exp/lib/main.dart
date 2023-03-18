import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              print("Icons button pressed");
            },
            icon: const Icon(Icons.smart_button),
          ),
          PopupMenuButton(
            itemBuilder: ((context) => [
                  PopupMenuItem(
                    child: const Text("Popup 1 item"),
                    onTap: () {
                      print("Popup 1 item");
                    },
                  ),
                  PopupMenuItem(
                    child: const Text("Popup 2 item"),
                    onTap: () {
                      print("Popup 2 item");
                    },
                  ),
                ]),
          ),
          DropdownButton(
              icon: const Icon(Icons.more_vert),
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("Drop Down 1 item"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Drop Down 2 item"),
                ),
              ],
              onChanged: (a) {
                if (a == 1) {
                  print("DrowpDown 1 item");
                } else {
                  print("DropDown 2 item");
                }
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp1(),
    );
  }
}

class MyApp1 extends StatefulWidget {
  const MyApp1({super.key});

  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Enginee'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchdelegate());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class MySearchdelegate extends SearchDelegate {
  List<String> sugRes = ["Amna", 'Amad', 'saad', 'jawad', 'yasir'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.close,
          color: Colors.red,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = '';
        }
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> sug = sugRes.where((element) {
      final result = element.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: sug.length,
      itemBuilder: (context, index) {
        final suge = sug[index].toLowerCase();

        return ListTile(
          title: Text(suge),
          onTap: (() {
            query = suge;
            showResults(context);
          }),
        );
      },
    );
  }
}

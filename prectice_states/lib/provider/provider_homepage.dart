import 'package:flutter/material.dart';

import 'package:prectice_states/provider/provider_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<DataItem> list = Provider.of<DataItemMethod>(context).item;
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: SafeArea(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      list[index].id.toString(),
                    ),
                  ),
                  title: Text(
                    list[index].name.toString(),
                  ),
                  subtitle: Text(
                    list[index].email.toString(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final DataItemMethod add = Provider.of<DataItemMethod>(
            context,
            listen: false,
          );
          add.addData();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

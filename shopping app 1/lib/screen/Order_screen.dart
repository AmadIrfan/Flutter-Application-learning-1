import 'package:appy/screen/appDrwar.dart';

import '../provider/order.dart';
import 'package:appy/widget/Order_Item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderItemScreen extends StatefulWidget {
  static const routeName = '/OrderdScreen';
  const OrderItemScreen({Key? key}) : super(key: key);

  @override
  State<OrderItemScreen> createState() => _OrderItemScreenState();
}

class _OrderItemScreenState extends State<OrderItemScreen> {
  // @override
  // void initState() {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   Future.delayed(Duration.zero).then((_) async {
  //     await Provider.of<Order>(context, listen: false).getandSet();
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // print('data provider loaded');
    // final loadData = Provider.of<Order>(context);
    // print('data provider loaded 1');
    Future _future;

    Future _obtainFutureData() {
      return Provider.of<Order>(context, listen: false).getandSet();
    }

    @override
    void initState() {
      _future = _obtainFutureData();
      super.initState();
    }

//_future use insted of future builder
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
      ),
      body: FutureBuilder(
        future: Provider.of<Order>(context, listen: false).getandSet(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<Order>(
              builder: ((context, loadData, child) => ListView.builder(
                    itemCount: loadData.orderList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OrderItems(order: loadData.orderList[index]);
                    },
                  )),
            );
          }
        },
      ),
      drawer: const Drawer(
        child: AppDrawer(),
      ),
    );
  }
}

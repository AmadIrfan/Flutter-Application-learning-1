import 'package:appy/provider/Product_provider.dart';
import 'package:appy/provider/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewItemDetail extends StatelessWidget {
  static const routeName = '/routeViewItemDetailScreen';
  const ViewItemDetail({Key? key}) : super(key: key);

  Widget textEditer(String title, double width) {
    return Container(
      width: width,
      height: 55,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routId = ModalRoute.of(context)?.settings.arguments as String;
    final loadData = Provider.of<Products>(context);
    final listData =
        loadData.item.firstWhere((element) => element.id == routId);
    return Scaffold(
      //appBar: AppBar(centerTitle: true, title: Text(listData.title)),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                // decoration: BoxDecoration(
                //     border: Border.all(width: 4, color: Colors.grey),
                //     borderRadius: BorderRadius.circular(10)),
                // margin: const EdgeInsets.all(10),
                width: double.infinity,
                // height: 500,
                child: Hero(
                  tag: listData.id,
                  child: Image.network(
                    listData.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              centerTitle: true,
              title: Text(
                listData.title,
                style: const TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            pinned: true,
            expandedHeight: 300,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textEditer('Price ', 100.0),
                    textEditer("${listData.price}/PKR", 250.0)
                  ],
                ),
                textEditer('Discription', double.infinity),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  //   height: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2)),
                  width: double.infinity,
                  child: Text(
                    listData.description,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 1000,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

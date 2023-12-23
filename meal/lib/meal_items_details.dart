import 'package:flutter/material.dart';
import 'package:newapp/model/dummy_meal.dart';

class MealItemDetails extends StatelessWidget {
  static const routeName = '/singleMealDetail';
  const MealItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dataId = ModalRoute.of(context)!.settings.arguments as String;
    final detailProduct = dummyMeals.firstWhere((element) {
      return element.id == dataId;
    });
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 550,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: dataId,
                child: // Text(detailProduct.title),
                    Image.network(
                  detailProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                detailProduct.title,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 5000,
                ),
                Text(detailProduct.title),
              ],
            ),
          )
        ],
      ),
    );
  }
}

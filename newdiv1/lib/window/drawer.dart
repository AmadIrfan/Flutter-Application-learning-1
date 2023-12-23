import 'package:flutter/material.dart';
import 'package:newdiv1/window/add_product.dart';
import 'package:newdiv1/window/home_page.dart';
import 'package:newdiv1/window/order_screen.dart';

class Drawers extends StatelessWidget {
  const Drawers({super.key});
  static const routName = '/Drawer';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
            ),
            const Positioned(
              left: 20,
              bottom: 20,
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.amber,
              ),
            ),
            const Positioned(
              left: 20,
              top: 70,
              child: Text(
                'Amad Irfan',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        _listTile(
          "Home",
          Icons.home,
          Icons.arrow_circle_right_outlined,
          () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: ((context) => const MyHomePage()),
            ));
          },
        ),
        _listTile(
          "Order ",
          Icons.shopify,
          Icons.arrow_circle_right_outlined,
          () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: ((context) => const OrderScreen()),
              ),
            );
          },
        ),
        _listTile(
          "Add Order",
          Icons.add_business_outlined,
          Icons.arrow_circle_right_outlined,
          () {
            Navigator.of(context).pushReplacementNamed(AddProduct.routName);
          },
        ),
      ],
    );
  }

  Widget _listTile(
      String title, IconData iconsData1, IconData iconsData2, Function data) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        trailing: Icon(
          iconsData2,
          size: 30,
        ),
        leading: Icon(
          iconsData1,
          size: 50,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        onTap: () => data(),
      ),
    );
  }
}

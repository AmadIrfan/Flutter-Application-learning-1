import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart '),
      ),
      body: Column(
        children: const [
          Center(
            child: Text('Cart'),
          ),
        ],
      ),
    );
  }
}

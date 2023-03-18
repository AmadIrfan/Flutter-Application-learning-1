import 'package:flutter/material.dart';

class Drawers extends StatelessWidget {
  const Drawers({Key? key}) : super(key: key);
  Widget _listTileCreator(String title, Icon icon, Function()? topOn) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      alignment: Alignment.center,
      child: ListTile(
        onTap: topOn,
        leading: icon,
        title: Text(
          title,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      margin: const EdgeInsets.symmetric(vertical: 30),
      color: Colors.blue,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 220,
            decoration: const BoxDecoration(//color: Colors.green
                ),
            child: const CircleAvatar(
              child: Text(
                'AAI',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _listTileCreator('title', const Icon(Icons.details), () {}),
              _listTileCreator('title', const Icon(Icons.details), () {}),
              _listTileCreator('title', const Icon(Icons.details), () {}),
            ],
          ),
        ],
      ),
    );
  }
}

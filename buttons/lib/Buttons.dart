import 'package:flutter/material.dart';

class Btns extends StatelessWidget {
  final VoidCallback incrementer;
  final int index;
  Btns(this.incrementer, this.index);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(11),
              margin: EdgeInsets.only(top: 12, bottom: 12),
              width: double.infinity,
              color: Colors.blueGrey,
              child: const Text(
                "Old Buttons ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
            ),
            RaisedButton(
              color: Colors.amber,
              hoverColor: Colors.black12,
              padding:
                  EdgeInsets.only(top: 12, bottom: 12, right: 12, left: 12),
              onPressed: incrementer,
              child: const Text(
                "Rised buttons",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FlatButton(
              //   color: Colors.green,
              onPressed: incrementer,
              child: const Text(
                "Flat Butons",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
                padding: EdgeInsets.all(11),
                margin: EdgeInsets.only(top: 12, bottom: 12),
                width: double.infinity,
                color: Colors.blueGrey,
                child: const Text(
                  "New Buttons ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(12),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  primary: Color.fromARGB(95, 2, 85, 16),
                  onPrimary: Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: incrementer,
                child: const Text("Elevated Buttons ")),
            TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    textStyle:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                onPressed: incrementer,
                child: const Text("Text Buttons")),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    primary: Color.fromARGB(255, 211, 116, 53),
                    backgroundColor: Colors.blue),
                onPressed: incrementer,
                child: const Text("Out Lined buttons")),
            Text(
              index.toString(),
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}

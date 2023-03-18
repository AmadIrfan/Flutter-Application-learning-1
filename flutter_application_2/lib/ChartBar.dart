import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';

class ChratBars extends StatelessWidget {
  final String title;
  final double amount;
  final double totAmount;

  const ChratBars(
      {Key? key,
      required this.title,
      required this.amount,
      required this.totAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(amount.toString())),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              width: 20,
              height: constraints.maxHeight * 0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  )),
              child: Stack(
                children: [
                  Container(
                    width: 20,
                    height: constraints.maxHeight * 0.6,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black)),
                    child: FractionallySizedBox(
                      heightFactor: totAmount,
                      child: Container(
                        width: 20,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(title)),
            )
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int result;
  final int qNo;
  final Function restarthandeler;
  const Score(
      {Key? key,
      required this.qNo,
      required this.result,
      required this.restarthandeler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  'Score :',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                Text(
                  result.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  'Attempted Questions :',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                Text(
                  qNo.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                )
              ],
            ),
            IconButton(
                tooltip: 'RestartQuiz',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: const Text('Permission'),
                          content: const Text(
                            'Are you Sure you Want to Restart Quiz ???',
                            style: TextStyle(fontSize: 20),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                restarthandeler();
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        );
                      });

                  // restarthandeler();
                },
                icon: const Icon(
                  Icons.restart_alt,
                  size: 35,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ResetPasword extends StatefulWidget {
  const ResetPasword({super.key});
  static const String routName = '/forgetEmailPassPage';
  @override
  State<ResetPasword> createState() => _ResetPaswordState();
}

class _ResetPaswordState extends State<ResetPasword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            child: const Text(
              'Password will sent on your Email! ',
              textAlign: TextAlign.center,
            ),
          ),
          Form(
            child: Expanded(
              child: ListView(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Send Email"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

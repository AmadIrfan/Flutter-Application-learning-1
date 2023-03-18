import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Widget wigCreator(String title, String content) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Row(
          children: [
            Text(
              title,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              content.isEmpty ? 'null' : content,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String id = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          wigCreator('ID :', id),
          wigCreator(
            'Email :',
            FirebaseAuth.instance.currentUser!.email.toString(),
          ),
          wigCreator('Token :',
              FirebaseAuth.instance.currentUser!.refreshToken.toString()),
        ],
      ),
    );
  }
}

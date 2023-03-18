import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(
        seconds: 3,
      ),
      builder: (context, value, child) => Opacity(
        opacity: value,
        child: const Text(
          "Animation App",
        ),
      ),
    );
  }
}

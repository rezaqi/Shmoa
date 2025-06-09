import 'package:flutter/material.dart';

class ShadowCover extends StatelessWidget {
  const ShadowCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0)
              ])),
    );
  }
}

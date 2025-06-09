import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const CustomPage(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          SizedBox(height: 30),
          SizedBox(height: 400, child: Lottie.network(image)),
          SizedBox(height: 70),
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

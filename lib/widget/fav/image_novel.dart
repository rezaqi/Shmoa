import 'package:flutter/material.dart';
import 'package:shimoa/core/constant/colors.dart';

class ImageNovel extends StatelessWidget {
  final String image;
  const ImageNovel({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: AppColor.colorSec, borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

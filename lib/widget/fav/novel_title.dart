import 'package:flutter/material.dart';
import 'package:shimoa/core/constant/colors.dart';

class NovelTitle extends StatelessWidget {
  final String title;
  const NovelTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 10,
      child: Container(
        alignment: Alignment.centerRight,
        width: 200,
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          title,
          textAlign: TextAlign.right,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.colorTex),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimoa/core/constant/colors.dart';

class NextPage extends StatelessWidget {
  final void Function()? ontap;
  final String title;
  const NextPage({super.key, required this.ontap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Text(
        title,
        style: TextStyle(color: AppColor.colorTex.withOpacity(0.7)),
      ),
    );
  }
}

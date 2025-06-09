import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimoa/core/constant/colors.dart';

class CustomTitlePages extends StatefulWidget {
  final String title;
  // final TextEditingController controller;
  // final void Function()? ontap;
  // final bool i;
  const CustomTitlePages({
    super.key,
    required this.title,
    // required this.controller,
    // this.ontap,
    // required this.i
  });

  @override
  State<CustomTitlePages> createState() => _CustomTitleState();
}

class _CustomTitleState extends State<CustomTitlePages> {
  bool i = false;
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: TextStyle(
          fontSize: 22.sp, fontWeight: FontWeight.bold, color: AppColor.title),
    );
  }
}

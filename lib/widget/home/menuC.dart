import 'package:flutter/material.dart';
import 'package:shimoa/core/constant/colors.dart';

class CustomMenu extends StatelessWidget {
  final String title;
  final IconData? icon;
  final double w;

  final void Function()? ontap;

  const CustomMenu({
    super.key,
    required this.title,
    this.icon,
    required this.w,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: w,
          child: InkWell(
            onTap: ontap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColor.title,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10), right: Radius.circular(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    icon,
                    size: 25,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.colorTex),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimoa/core/constant/colors.dart';

class ItemTitle extends StatelessWidget {
  final String title;
  final bool showMore;
  final void Function()? ontap;
  const ItemTitle(
      {super.key, required this.title, required this.showMore, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showMore == true
              ? InkWell(
                  onTap: ontap,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColor.colorSec,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "عرض المزيد",
                      style: TextStyle(
                          color: AppColor.bottom,
                          fontSize: Get.size.height / 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : Container(),
          Text(title,
              style: TextStyle(
                  color: AppColor.colorTex,
                  fontSize: Get.size.height / 50,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

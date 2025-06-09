import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showMore == true
              ? InkWell(
                  onTap: ontap,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                    decoration: BoxDecoration(
                        color: AppColor.colorSec,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Text(
                      "عرض المزيد",
                      style: TextStyle(
                          color: AppColor.bottom,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : Container(),
          Text(title,
              style: TextStyle(
                  color: AppColor.colorTex,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

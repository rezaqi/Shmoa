import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimoa/controller/read/read_controller.dart';
import 'package:shimoa/core/constant/colors.dart';

class Reading extends StatelessWidget {
  final ReadControllerImp c;
  const Reading({super.key, required this.c});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: c.novelParts.length,
        itemBuilder: (context, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                c.novelParts[i].replaceAll('^', '\n'),
                textAlign: TextAlign.end,
                style: TextStyle(
                    color: AppColor.title, fontSize: 19.sp, height: 1.5.h),
              ),
              if (i < c.novelParts.length - 1)
                Container(
                  margin: EdgeInsets.only(right: 30.w),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${i + 1}",
                    style: TextStyle(
                      fontFamily: "Monoton",
                      color: AppColor.title,
                      fontSize: 50.sp,
                    ),
                  ),
                )
            ],
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/constant/routs_name.dart';
import 'package:shimoa/widget/home/menuC.dart';

class Menu extends StatelessWidget {
  final void Function()? ontapSuggest;
  const Menu({super.key, this.ontapSuggest});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          color: AppColor.colorSec,
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, top: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomMenu(
                  ontap: () {
                    Get.offAllNamed(AppRouts.homeAbn);
                  },
                  w: 260.w,
                  title: "القائمة الرائسية",
                  icon: Icons.home_outlined,
                ),
                CustomMenu(
                  ontap: () {
                    Get.toNamed(AppRouts.fav);
                  },
                  w: 240.w,
                  title: "المفضلات",
                  icon: Icons.favorite_border,
                ),
                CustomMenu(
                  ontap: () {
                    Get.toNamed(AppRouts.save);
                  },
                  w: 220.w,
                  title: "المحفوظات",
                  icon: Icons.bookmark_outline_outlined,
                ),
                CustomMenu(
                  ontap: ontapSuggest,
                  w: 200.w,
                  title: "القصص",
                  icon: Icons.menu_book_rounded,
                ),
                CustomMenu(
                  ontap: () {
                    Get.toNamed(AppRouts.prophet);
                  },
                  w: 180.w,
                  title: "قبل الميلاد",
                  icon: Icons.auto_awesome,
                ),
                CustomMenu(
                  ontap: () {
                    Get.toNamed(AppRouts.messanger);
                  },
                  w: 160.w,
                  title: "الرسل",
                  icon: Icons.auto_awesome,
                ),
                CustomMenu(
                  ontap: () {
                    Get.toNamed(AppRouts.child);
                  },
                  w: 140.w,
                  title: "الاطفال",
                  icon: Icons.child_care_sharp,
                ),
                CustomMenu(
                  ontap: () {
                    Get.toNamed(AppRouts.aboutme);
                  },
                  w: 120.w,
                  title: "عنى",
                  icon: Icons.error,
                )
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/constant/routs_name.dart';
import 'package:shimoa/widget/home/menuC.dart';

class Menu extends StatelessWidget {
  final void Function()? ontapSuggest;
  const Menu({super.key, this.ontapSuggest});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: AppColor.colorSec,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomMenu(
                ontap: () {
                  Get.offAllNamed(AppRouts.homeAbn);
                },
                w: Get.width / 1.4,
                title: "القائمة الرائسية",
                icon: Icons.home_outlined,
              ),
              CustomMenu(
                ontap: () {
                  Get.toNamed(AppRouts.fav);
                },
                w: Get.width / 1.5,
                title: "المفضلات",
                icon: Icons.favorite_border,
              ),
              CustomMenu(
                ontap: () {
                  Get.toNamed(AppRouts.save);
                },
                w: Get.width / 1.6,
                title: "المحفوظات",
                icon: Icons.bookmark_outline_outlined,
              ),
              CustomMenu(
                ontap: ontapSuggest,
                w: Get.width / 1.75,
                title: "القصص",
                icon: Icons.menu_book_rounded,
              ),
              CustomMenu(
                ontap: () {
                  Get.toNamed(AppRouts.prophet);
                },
                w: Get.width / 1.95,
                title: "قبل الميلاد",
                icon: Icons.auto_awesome,
              ),
              CustomMenu(
                ontap: () {
                  Get.toNamed(AppRouts.messanger);
                },
                w: Get.width / 2.2,
                title: "الرسل",
                icon: Icons.auto_awesome,
              ),
              CustomMenu(
                ontap: () {
                  Get.toNamed(AppRouts.child);
                },
                w: Get.width / 2.5,
                title: "الاطفال",
                icon: Icons.child_care_sharp,
              ),
              CustomMenu(
                ontap: () {
                  Get.toNamed(AppRouts.aboutme);
                },
                w: Get.width / 2.9,
                title: "عنى",
                icon: Icons.error,
              )
            ],
          ),
        ));
  }
}

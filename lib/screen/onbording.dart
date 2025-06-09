import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shimoa/controller/controllers_app/onbording_controller.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/constant/routs_name.dart';
import 'package:shimoa/widget/onbording/pagemed.dart';
import 'package:shimoa/widget/onbording/pages.dart';

class OnBording extends StatefulWidget {
  const OnBording({super.key});

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  @override
  Widget build(BuildContext context) {
    int currentPage = 0;
    OnBordingControllerImp c = Get.put(OnBordingControllerImp());
    return Scaffold(
        backgroundColor: AppColor.colorSec,
        body: LiquidSwipe(
            onPageChangeCallback: (page) {
              setState(() {
                currentPage = page;
              });
              print(currentPage);
              if (currentPage == 3) {
                Get.offAllNamed(AppRouts.homeAbn);
              } else {
                print(currentPage);
              }
            },
            fullTransitionValue: 500,
            slideIconWidget: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            enableLoop: false,
            positionSlideIcon: 0.5,
            pages: [
              Container(
                color: AppColor.name,
                child: const CustomPage(
                  image:
                      "https://lottie.host/ba8e6e94-e073-41a6-bee1-bb6e3c76ecef/S43qQs4Z10.json",
                  title: "الخلاص",
                  description:
                      "خلاص المسيح المقدم للبشرية التى خلقها وسقطت ولا يستطيع أحد أن ينقذها إلا المسيح الفادى",
                ),
              ),
              Container(color: AppColor.colorSec, child: const PageMed()),
              Container(
                color: AppColor.bottom,
                child: const CustomPage(
                  image:
                      "https://lottie.host/b8624c08-4ada-42ab-8d0f-742d1a1faa29/rp4GGRUEVv.json",
                  title: "الملكوت",
                  description:
                      "ثم إعلان هذا الخلاص واضحًا فى العهد الجديد للعالم كله حتى يؤمن به ويتمتع بحياة بعد الموت وسعادة أبدية، فهو مرشد للإنسان يقوده إلى الملكوت.",
                ),
              ),
              Container(
                color: AppColor.colorBG,
                child: c.done(),
              )
            ]));
  }
}

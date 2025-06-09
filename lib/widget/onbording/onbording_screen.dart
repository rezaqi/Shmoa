import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimoa/controller/controllers_app/onbording_controller.dart';
import 'package:shimoa/widget/onbording/pagemed.dart';
import 'package:shimoa/widget/onbording/pages.dart';

class OnBordingScreen extends GetView<OnBordingControllerImp> {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControllerImp());
    return PageView(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onChanged(val);
      },
      children: const [
        CustomPage(
          image:
              "https://lottie.host/ba8e6e94-e073-41a6-bee1-bb6e3c76ecef/S43qQs4Z10.json",
          title: "الخلاص",
          description:
              "خلاص المسيح المقدم للبشرية التى خلقها وسقطت ولا يستطيع أحد أن ينقذها إلا المسيح الفادى",
        ),
        PageMed(),
        CustomPage(
          image:
              "https://lottie.host/b8624c08-4ada-42ab-8d0f-742d1a1faa29/rp4GGRUEVv.json",
          title: "الملكوت",
          description:
              "ثم إعلان هذا الخلاص واضحًا فى العهد الجديد للعالم كله حتى يؤمن به ويتمتع بحياة بعد الموت وسعادة أبدية، فهو مرشد للإنسان يقوده إلى الملكوت.",
        )
      ],
    );
  }
}

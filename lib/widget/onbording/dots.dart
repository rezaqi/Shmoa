import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimoa/controller/controllers_app/onbording_controller.dart';

class DotsPage extends StatelessWidget {
  const DotsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControllerImp());
    return GetBuilder<OnBordingControllerImp>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              3,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        color: controller.currentPage != index
                            ? Colors.blueGrey[700]
                            : Colors.blueGrey[900],
                        borderRadius: BorderRadius.circular(20)),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear,
                    height: 7,
                    width: controller.currentPage == index ? 15 : 7,
                  ))
        ],
      );
    });
  }
}

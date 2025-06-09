import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimoa/core/constant/routs_name.dart';
import 'package:shimoa/core/services/services.dart';

abstract class OnBordingController extends GetxController {
  late PageController pageController;

  MyServices myServices = Get.find();
  int currentPage = 0;
  next();
  skip();
  onChanged(int val);
  done();
}

class OnBordingControllerImp extends OnBordingController {
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  next() {
    currentPage++;
    print(currentPage);
    if (currentPage > 2) {
      Get.offAllNamed(AppRouts.home);
      myServices.sharedPref.setString("step", "2");
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 600), curve: Curves.linear);
    }

    update();
  }

  @override
  onChanged(val) {
    currentPage = val;
    update();
  }

  @override
  skip() {
    currentPage = 2;
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 600), curve: Curves.linear);
  }

  @override
  done() {
    myServices.sharedPref.setString("step", "2");
  }
}

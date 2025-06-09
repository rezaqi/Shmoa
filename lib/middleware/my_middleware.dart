import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimoa/core/constant/routs_name.dart';
import 'package:shimoa/core/services/services.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices _myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (_myServices.sharedPref.getString("step") == "2") {
      return const RouteSettings(name: AppRouts.home);
    }
    if (_myServices.sharedPref.getString("step") == "1") {
      return const RouteSettings(name: AppRouts.onbording);
    }
  }
}

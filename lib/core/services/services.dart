import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPref;

  Future<MyServices> init() async {
    sharedPref = await SharedPreferences.getInstance();
    return this;
  }
}

// ignore: non_constant_identifier_names
InitialServices() async {
  await Get.putAsync(() => MyServices().init());
}

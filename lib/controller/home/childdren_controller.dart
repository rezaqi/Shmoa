import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shimoa/controller/search_controller.dart';
import 'package:shimoa/core/class/status_request.dart';
import 'package:shimoa/core/services/services.dart';
import 'package:shimoa/data/datasource/remote/childdren_data.dart';
import 'package:shimoa/data/model/novels_model_f.dart';

abstract class ChildController extends SearchMaxController {
  DataChild dataPChild = DataChild(Get.find());
  List<NovelsModelFire> data = [];
  Future<void> getData();
  MyServices myServices = Get.find();
  int i = 1;
  onMore();
  // fav and save
  onFav(String id);
  onSaved(String id);
  bool isSaved = false;
  List<String>? favList = [];
  List<String>? saveList = [];
  initialData();
  // get();
}

class ChildControllerImp extends ChildController {
  @override
  onMore() {
    i++;
    update();
  }

  @override
  void onInit() async {
    print("enter");
    await initialData();
    getData();
    super.onInit();
  }

  @override
  Future<void> getData() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("novels")
          .where("child", isEqualTo: "0")
          .get();
      data.clear();
      List listData = snapshot.docs;
      data.addAll(listData.map((e) => NovelsModelFire.fromFirestore(e)));
      statusRequest = StatusRequest.success;
    } catch (e) {
      print("_______error in child is --- $e");
    }
    update();
  }

  @override
  onFav(id) {
    if (favList != null && favList!.contains(id)) {
      favList!.remove(id);
      myServices.sharedPref.setStringList("fav", favList!);
      print("remove");
    } else {
      favList ??= [];
      favList!.add(id);
      myServices.sharedPref.setStringList("fav", favList!);
    }
    update();
  }

  @override
  onSaved(String id) {
    if (saveList != null && saveList!.contains(id)) {
      saveList!.remove(id);
      myServices.sharedPref.setStringList("save", saveList!);
      isSaved = false;
      print("remove");
    } else {
      saveList ??= [];
      saveList!.add(id);
      myServices.sharedPref.setStringList("save", saveList!);
      isSaved = true;
      print("add");
    }
    update();
  }

  @override
  initialData() {
    print("her");
    favList ??= [];
    favList = myServices.sharedPref.getStringList('fav');
    saveList = myServices.sharedPref.getStringList('save');
    print("_________________fav");
    print(favList);
  }

  // @override
  // get() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var res = await dataPChild.get();
  //   statusRequest = handling(res);
  //   if (statusRequest == StatusRequest.success) {
  //     if (res["status"] == "success") {
  //       List listData = res["data"];
  //       listData.shuffle();
  //       data.addAll(listData.map((e) => NovelsModel.fromJson(e)));
  //     }
  //   } else {
  //     statusRequest = StatusRequest.empty;
  //   }
  //   update();
  // }
}

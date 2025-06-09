import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shimoa/controller/search_controller.dart';
import 'package:shimoa/core/class/status_request.dart';
import 'package:shimoa/core/constant/routs_name.dart';
import 'package:shimoa/core/services/services.dart';
import 'package:shimoa/data/datasource/remote/novels.dart';
import 'package:shimoa/data/model/novels_model_f.dart';

abstract class GetNovelsController extends SearchMaxController {
  DataNovels dataNovels = DataNovels(Get.find());
  MyServices myServices = Get.find();
  List<NovelsModelFire> data = [];
  // List<NovelsModel> data = [];

  // getNovels();
  goToSuggest();
  onFav(String id);
  onSaved(String id);
  initialData();

  bool isSaved = false;
  List<String>? favList = [];
  List<String>? saveList = [];
}

class GetNovelsControllerImp extends GetNovelsController {
  @override
  void onInit() {
    getDataFire();
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    favList ??= [];
    favList = myServices.sharedPref.getStringList('fav');
    saveList = myServices.sharedPref.getStringList('save');
    getDataFire();
    //  getNovels();
  }

  // @override
  // getNovels() async {
  //   statusRequest = StatusRequest.loading;
  //   var res = await dataNovels.get();
  //   statusRequest = handling(res);

  //   if (statusRequest == StatusRequest.success) {
  //     if (res["status"] == "success") {
  //       data.clear();
  //       List listData = res["data"];
  //       listData.shuffle();
  //       data.addAll(listData.map((e) => NovelsModel.fromJson(e)));
  //     }
  //   }
  //   update();
  // }

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

  Future<void> getDataFire() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("novels").get();
      data.clear();
      List listData = querySnapshot.docs;
      listData.shuffle();
      data.addAll(listData.map((e) => NovelsModelFire.fromFirestore(e)));

      print("________________________data");
      print(data);
      statusRequest = StatusRequest.success;

      update();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        List<String> dataNovel = [querySnapshot.docs[i].id];
        myServices.sharedPref.setStringList("novels", dataNovel);
        dataNovel.clear();
      }
    } catch (e) {
      print('Error fetching data: $e');
      statusRequest = StatusRequest.empty;
      update();
      // rethrow;
    }
    update();
  }

  @override
  goToSuggest() {
    Get.toNamed(AppRouts.suggests, arguments: {"suggest": data});
  }
}

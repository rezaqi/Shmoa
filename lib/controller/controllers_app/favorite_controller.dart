import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shimoa/core/class/status_request.dart';
import 'package:shimoa/core/services/services.dart';
import 'package:shimoa/data/datasource/remote/fav_data.dart';
import 'package:shimoa/data/model/novels_model_f.dart';

abstract class FavoriteController extends GetxController {
  //  SQL
  DataFav dataFav = DataFav(Get.find());
  MyServices myServices = Get.find();
  // status request
  late StatusRequest statusRequest;
  // firebase
  Future<void> getFav(String id);
  List<String>? novels = [];
  List<String>? k = [];
  late String fav;
  List<NovelsModelFire> data = [];
  Future<void> onRefresh();

  onRemove(String id);
}

class FavoriteControllerImp extends FavoriteController {
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() async {
    statusRequest = StatusRequest.loading;
    update();
    novels = myServices.sharedPref.getStringList("novels");
    k = myServices.sharedPref.getStringList("fav");
    print("__________________________fav_________________________");
    if (k != null) {
      if (k!.isNotEmpty) {
        fav = k!.join(",");
      }
      print(k!.join(","));
      getFav(k!.join(","));
    } else {
      statusRequest = StatusRequest.empty;
      update();
    }
  }

  @override
  onRefresh() async {
    await initialData();
  }

  @override
  onRemove(String id) async {
    statusRequest = StatusRequest.loading;
    update();
    k!.remove(id);
    myServices.sharedPref.setStringList("fav", k!);
    k!.clear();
    initialData();
    update();
  }

  @override
  getFav(String id) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("novels").get();
      data.clear();
      for (int i = 0; i < snapshot.docs.length; i++) {
        if (id.contains(snapshot.docs[i].id)) {
          List listData = [snapshot.docs[i]];
          data.addAll(listData.map((e) => NovelsModelFire.fromFirestore(e)));
        }
      }
      statusRequest = StatusRequest.success;

      update();
    } catch (e) {
      print("error i fav ----------------------is $e");
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  // @override
  // getFav(id) async {
  //   try {
  //     statusRequest = StatusRequest.loading;
  //     update();
  //     var res = await dataFav.get(id);
  //     statusRequest = handling(res);
  //     if (statusRequest == StatusRequest.success) {
  //       if (res["status"] == "success") {
  //         List listData = res["data"];
  //         print("______________________ data _______________________-");
  //         print(data);
  //         data.clear();
  //         print(data);
  //         data.addAll(listData.map((e) => NovelsModel.fromJson(e)));
  //         print("______________________ data@=2 _______________________-");
  //         print(data);
  //         print("+++++++++++++++++ k in get ++++++++++++++++++++++");
  //         print(k);
  //       }
  //     } else {
  //       statusRequest = StatusRequest.empty;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   update();
  // }
}

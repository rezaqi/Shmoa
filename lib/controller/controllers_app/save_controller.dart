import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shimoa/core/class/status_request.dart';
import 'package:shimoa/core/services/services.dart';
import 'package:shimoa/data/datasource/remote/save_data.dart';
import 'package:shimoa/data/model/novels_model_f.dart';

abstract class SaveController extends GetxController {
  DataSave dataSave = DataSave(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  List<NovelsModelFire> data = [];
  List<String>? save = [];

  getSave(String id);
  onRemove(String id);
  initialData();
  Future<void> onRefresh();
}

class SaveControllerImp extends SaveController {
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    statusRequest = StatusRequest.loading;
    save = myServices.sharedPref.getStringList("save");

    if (save != null) {
      print(save!.join(","));
      getSave(save!.join(","));
    } else {
      getSave("");
    }
  }

  // @override
  // getSave(id) async {
  //   try {
  //     statusRequest = StatusRequest.loading;
  //     update();
  //     var res = await dataSave.get(id);
  //     statusRequest = handling(res);
  //     if (statusRequest == StatusRequest.success) {
  //       if (res["status"] == "success") {
  //         data.clear();
  //         List listDtat = res["data"];
  //         data.addAll(listDtat.map((e) => NovelsModel.fromJson(e)));
  //       }
  //     } else {
  //       print("object");
  //       statusRequest = StatusRequest.empty;
  //     }
  //   } catch (e) {
  //     print("___________________ error in get save ---------------------");
  //     print(e);
  //   }
  //   update();
  // }

  @override
  onRemove(id) async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      save!.remove(id);
      myServices.sharedPref.setStringList("save", save!);
      save!.clear();
      initialData();
    } catch (e) {
      print("_____________________ remove from save _____________________");
      print(e);
    }
  }

  @override
  Future<void> onRefresh() async {
    await initialData();
  }

  @override
  getSave(String id) async {
    try {
      if (id == "") {
        return statusRequest = StatusRequest.empty;
      }
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
}

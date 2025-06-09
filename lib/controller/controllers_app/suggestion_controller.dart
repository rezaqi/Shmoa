import 'package:get/get.dart';
import 'package:shimoa/controller/search_controller.dart';
import 'package:shimoa/core/services/services.dart';
import 'package:shimoa/data/model/novels_model_f.dart';

abstract class SuggestController extends SearchMaxController {
  List<NovelsModelFire> data = [];
  MyServices myServices = Get.find();
  onMore();
  int current = 1;
  // fav and save
  onFav(String id);
  onSaved(String id);
  bool isSaved = false;
  List<String>? favList = [];
  List<String>? saveList = [];
}

class SuggestControllerImp extends SuggestController {
  @override
  void onInit() {
    data = Get.arguments["suggest"];
    initialData();
    super.onInit();
  }

  @override
  onMore() {
    current++;
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
    favList ??= [];
    favList = myServices.sharedPref.getStringList('fav');
    saveList = myServices.sharedPref.getStringList('save');
  }
}

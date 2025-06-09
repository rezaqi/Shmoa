import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimoa/core/class/ad_manger.dart';
import 'package:shimoa/core/class/status_request.dart';
import 'package:shimoa/core/services/services.dart';
import 'package:shimoa/data/model/novels_model_f.dart';

abstract class ReadController extends GetxController {
  late StatusRequest statusRequest;
  late NovelsModelFire novelsModel;
  final ScrollController scrollController = ScrollController();

  bool loading = false;
  MyServices myServices = Get.find();
  // fav and save
  onFav(String id);
  onSaved(String id);
  bool isSaved = false;
  List<String>? favList = [];
  List<String>? saveList = [];

////// ads
  BannerAd? bannerAd;
  bool isLoaded = false;
  void load();
/////////////////////
  void splitStoryIntoParts();

// for make a parts from novel
  List<String> novelParts = [];
}

class ReadControllerImp extends ReadController {
  @override
  void onInit() {
    novelsModel = Get.arguments["novel"];
    initialData();

    splitStoryIntoParts();
    super.onInit();
  }

  @override
  splitStoryIntoParts() {
    novelParts.addAll(novelsModel.story!.split("@"));
    update();
  }

  // fav and save
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

  @override
  void load() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdManger.ad,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            isLoaded = true;
            update();
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
        request: AdRequest())
      ..load();
  }
}

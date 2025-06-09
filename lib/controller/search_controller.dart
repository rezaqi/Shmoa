import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimoa/core/class/status_request.dart';
import 'package:shimoa/data/model/novels_model_f.dart';

class SearchMaxController extends GetxController {
  StatusRequest statusRequest = StatusRequest.success;

  List<NovelsModelFire> searchD = [];
  late TextEditingController textC;
  bool isSearch = false;

  @override
  void onInit() {
    textC = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    textC.dispose(); // التخلص من TextEditingController
    super.dispose();
  }

  void onSearch() {
    if (textC.text.isEmpty) {
      isSearch = false;
      searchD.clear(); // مسح النتائج عند عدم وجود استعلام
      statusRequest = StatusRequest.success;
    } else {
      isSearch = true;
      search(textC.text);
    }
    update();
  }

  Future<void> search(String query) async {
    statusRequest = StatusRequest.loading;
    update();

    try {
      final res = await FirebaseFirestore.instance
          .collection("novels")
          .orderBy("title")
          .startAt([query]).endAt([query + '\uf8ff']).get();

      searchD = res.docs.map((e) => NovelsModelFire.fromFirestore(e)).toList();

      if (searchD.isEmpty) {
        statusRequest = StatusRequest.empty; // حالة عدم العثور على نتائج
      } else {
        statusRequest = StatusRequest.success;
      }
    } catch (error) {
      print('Error searching novels: $error');
      statusRequest = StatusRequest.serverFailure; // حالة الخطأ
    }

    update();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimoa/core/class/status_request.dart';
import 'package:shimoa/core/constant/colors.dart';

class HandlingDataView extends StatefulWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  State<HandlingDataView> createState() => _HandlingDataViewState();
}

class _HandlingDataViewState extends State<HandlingDataView> {
  @override
  Widget build(BuildContext context) {
    return widget.statusRequest == StatusRequest.loading
        ? Center(
            child: LoadingAnimationWidget.beat(
              color: Colors.white,
              size: 10.sp,
            ),
          )
        : widget.statusRequest == StatusRequest.empty
            ? Center(
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.colorSec,
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text(
                      "فارغ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              )
            : widget.statusRequest == StatusRequest.offline
                ? Center(
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.colorSec,
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Text(
                          "لست متصل بالانترنت",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  )
                : widget.statusRequest == StatusRequest.serverFailure
                    ? Center(
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColor.colorSec,
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: const Text(
                              "حدث خطأ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                      )
                    : widget.statusRequest == StatusRequest.serverExpection
                        ? Center(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.colorSec,
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                child: const Text(
                                  "حدث خطأ غير متوقع",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                          )
                        : widget.widget;
  }
}

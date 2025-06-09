import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimoa/core/class/status_request.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/constant/routs_name.dart';
import 'package:video_player/video_player.dart';

class HandlingDataView extends StatefulWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  State<HandlingDataView> createState() => _HandlingDataViewState();
}

class _HandlingDataViewState extends State<HandlingDataView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/videos/logo.mov")
      ..initialize().then((value) => {setState(() {})});
    _controller.value.isPlaying;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.statusRequest == StatusRequest.loading
        ? Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset("assets/videos/logo.gif"),
            ),
          )
        : widget.statusRequest == StatusRequest.empty
            ? Scaffold(
                appBar: AppBar(
                  leading: InkWell(
                    onTap: () {
                      Get.offAllNamed(AppRouts.homeAbn);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColor.name,
                    ),
                  ),
                ),
                body: Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.colorSec,
                          borderRadius: BorderRadius.circular(20)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Text(
                        "فارغ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                ))
            : widget.statusRequest == StatusRequest.offline
                ? Scaffold(
                    appBar: AppBar(
                      leading: InkWell(
                        onTap: () {
                          Get.offAllNamed(AppRouts.homeAbn);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColor.name,
                        ),
                      ),
                    ),
                    body: Center(
                      child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.colorSec,
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Text(
                            "لست متصل بالانترنت",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ))
                : widget.statusRequest == StatusRequest.serverFailure
                    ? Scaffold(
                        appBar: AppBar(
                          leading: InkWell(
                            onTap: () {
                              Get.offAllNamed(AppRouts.homeAbn);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: AppColor.name,
                            ),
                          ),
                        ),
                        body: Center(
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
                        ))
                    : widget.statusRequest == StatusRequest.serverExpection
                        ? Scaffold(
                            appBar: AppBar(
                              leading: InkWell(
                                onTap: () {
                                  Get.offAllNamed(AppRouts.homeAbn);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: AppColor.name,
                                ),
                              ),
                            ),
                            body: Center(
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
                            ))
                        : widget.widget;
  }
}

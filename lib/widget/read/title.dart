import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimoa/controller/read/audio_controller.dart';
import 'package:shimoa/controller/read/read_controller.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/widget/read/audio.dart';
import 'package:shimoa/widget/read/change_playe_buttom.dart';

class TitleRead extends StatelessWidget {
  final ReadControllerImp c;
  const TitleRead({super.key, required this.c});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioNovelController>(builder: (context, cA, child) {
      return Column(
        children: [
          Container(
            //  width: Get.width / 2,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),

            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: AppColor.colorSec,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(),
                    Text(
                      "${c.novelsModel.title}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColor.colorTex.withOpacity(0.8),
                          fontSize: Get.size.height / 40,
                          fontWeight: FontWeight.w600),
                    ),
                    c.novelsModel.audio == ""
                        ? const SizedBox()
                        : ChangePlayButtom(
                            audioName: "${c.novelsModel.audio}",
                            novelTitle: "${c.novelsModel.title}")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                cA.linerPlayer == false
                    ? const SizedBox()
                    : const NovelAudioPlayer()
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              c.novelsModel.begin == ''
                  ? Container()
                  : Container(
                      width: Get.width / 4,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColor.colorSec,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(
                            "الولاده",
                            style: TextStyle(
                                color: AppColor.colorTex.withOpacity(0.8),
                                fontSize: Get.size.height / 50,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "${c.novelsModel.begin} م",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.colorTex.withOpacity(0.8),
                                fontSize: Get.size.height / 40,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
              c.novelsModel.nickName == ""
                  ? Container()
                  : Container(
                      width: Get.width / 4,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColor.colorSec,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "${c.novelsModel.nickName}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.colorTex.withOpacity(0.8),
                            fontSize: Get.size.height / 50,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
              c.novelsModel.begin == ''
                  ? Container()
                  : Container(
                      width: Get.width / 4,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColor.colorSec,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Text(
                            "النياحة",
                            style: TextStyle(
                                color: AppColor.colorTex.withOpacity(0.8),
                                fontSize: Get.size.height / 50,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "${c.novelsModel.end} م",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.colorTex.withOpacity(0.8),
                                fontSize: Get.size.height / 40,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ],
      );
    });
  }
}

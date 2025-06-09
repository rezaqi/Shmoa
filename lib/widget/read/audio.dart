import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimoa/controller/read/audio_controller.dart';
import 'package:shimoa/controller/read/read_controller.dart';
import 'package:shimoa/core/constant/colors.dart';

class NovelAudioPlayer extends StatefulWidget {
  const NovelAudioPlayer({
    super.key,
  });

  @override
  State<NovelAudioPlayer> createState() => _NovelAudioPlayerState();
}

class _NovelAudioPlayerState extends State<NovelAudioPlayer> {
  @override
  void initState() {
    super.initState();
    Get.put(ReadControllerImp());
  }

  String formaTime(Duration duration) {
    String toDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTimed = "${duration.inMinutes}:$toDigitSeconds";
    return formattedTimed;
  }

  @override
  Widget build(BuildContext context) {
    ReadControllerImp c = Get.put(ReadControllerImp());
    return Consumer<AudioNovelController>(
      builder: (context, controller, child) {
        return SizedBox(
          width: 300.w,
          height: 30.h,
          child: Column(
            children: [
              Container(
                width: 270.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: AppColor.colorSec,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Slider(
                  activeColor: AppColor.colorTex,
                  inactiveColor: AppColor.colorTex.withOpacity(0.3),
                  min: 0,
                  value: controller.currentDuration.inSeconds.toDouble(),
                  max: controller.totalDuration.inSeconds.toDouble(),
                  onChanged: (value) {
                    controller.play("${c.novelsModel.audio}");
                  },
                  onChangeEnd: (double double) {
                    controller.seek(Duration(seconds: double.toInt()));
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // position song
                  Text(
                    formaTime(controller.currentDuration),
                    style: TextStyle(color: AppColor.name),
                  ),
                  // end song
                  Text(
                    formaTime(controller.totalDuration),
                    style: TextStyle(color: AppColor.name),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

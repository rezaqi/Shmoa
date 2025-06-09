import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimoa/controller/read/audio_controller.dart';
import 'package:shimoa/core/constant/colors.dart';

class ChangePlayButtom extends StatelessWidget {
  final String audioName;
  final String novelTitle;

  const ChangePlayButtom(
      {super.key, required this.audioName, required this.novelTitle});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioNovelController>(
        builder: (BuildContext context, c, child) {
      return c.done == false
          ? const CircularProgressIndicator(
              color: AppColor.name,
            )
          : InkWell(
              onTap: () {
                c.isPlay == false ? c.play(audioName) : c.pause();
              },
              child: Container(
                height: 40,
                width: 50,
                decoration: BoxDecoration(
                    color: AppColor.title,
                    borderRadius: BorderRadius.circular(20)),
                child: c.isPlay == false
                    ? Icon(Icons.play_arrow)
                    : Icon(Icons.pause),
              ));
    });
  }
}

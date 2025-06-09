import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimoa/controller/read/read_controller.dart';
import 'package:shimoa/core/constant/colors.dart';

class Reading extends StatelessWidget {
  final ReadControllerImp c;
  const Reading({super.key, required this.c});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: c.novelParts.length,
        itemBuilder: (context, i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                c.novelParts[i].replaceAll('^', '\n'),
                textAlign: TextAlign.end,
                style: const TextStyle(
                    color: AppColor.title, fontSize: 20, height: 2),
              ),
              if (i < c.novelParts.length - 1)
                Container(
                  margin: EdgeInsets.only(right: 60),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${i + 1}",
                    style: TextStyle(
                      fontFamily: "Monoton",
                      color: AppColor.title,
                      fontSize: Get.size.height / 15,
                    ),
                  ),
                )
            ],
          );
        });
  }
}

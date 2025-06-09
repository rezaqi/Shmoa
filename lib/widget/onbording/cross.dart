import 'package:flutter/material.dart';
import 'package:shimoa/core/constant/colors.dart';

class Cross extends StatelessWidget {
  const Cross({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        height: 80,
        width: 80,
        child: CircleAvatar(
            backgroundColor: AppColor.colorTex,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  width: 10,
                  height: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  margin: EdgeInsets.only(bottom: 20),
                  width: 40,
                  height: 10,
                ),
              ],
            )),
      ),
    );
  }
}

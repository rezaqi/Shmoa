import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimoa/controller/home/abn_controller.dart';
import 'package:shimoa/core/constant/colors.dart';

class HomeAbn extends StatelessWidget {
  const HomeAbn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AbnControllerImp());
    return GetBuilder<AbnControllerImp>(builder: (abnC) {
      return Scaffold(
          body: Stack(
        alignment: Alignment.center,
        children: [
          abnC.listPage.elementAt(abnC.currentPage),
          Positioned(
            bottom: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.colorSec,
                  borderRadius: BorderRadius.circular(80)),
              height: 100,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                      abnC.listPage.length,
                      (i) => CustomAnb(
                            c: abnC,
                            current: i,
                            i: abnC.currentPage == i ? true : false,
                            icon: abnC.listButton[i]["icon"],
                            title: abnC.listButton[i]["title"],
                          ))
                ],
              ),
            ),
          )
        ],
      ));
    });
  }
}

class CustomAnb extends StatefulWidget {
  final String icon;
  final String title;
  final bool i;
  final int current;
  final AbnControllerImp c;
//final void Function()? ontap;

  const CustomAnb(
      {super.key,
      required this.icon,
      required this.title,
      required this.i,
      required this.c,
      required this.current});

  @override
  State<CustomAnb> createState() => _CustomAnbState();
}

class _CustomAnbState extends State<CustomAnb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isAnimating || _controller.isCompleted) {
          _controller.reset();
        }
        _controller.forward();
        widget.c.goToPage(widget.current);
      },
      child: AnimatedContainer(
        height: 80,
        width: widget.i ? 80 : 60,
        curve: Curves.linear,
        duration: Duration(seconds: 1),
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: Get.width / 40),
        decoration: BoxDecoration(
          borderRadius:
              widget.i ? BorderRadius.circular(50) : BorderRadius.circular(50),
          color: widget.i ? AppColor.colorBG : AppColor.colorTex.withOpacity(0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: widget.i ? 45 : 40,
                width: widget.i ? 45 : 40,
                child: Lottie.asset(
                  widget.icon,
                  controller: _controller,
                  onLoaded: (composition) {
                    _controller..duration = composition.duration;
                  },
                )),
          ],
        ),
      ),
    );
  }
}


 // Icon(
            //   icon,
            //   size: 25,
            //   color: i ? AppColor.bottom : AppColor.colorTex.withOpacity(0.8),
            // ),
            // Text(
            //   widget.title,
            //   style: TextStyle(
            //       color: widget.i
            //           ? AppColor.bottom
            //           : AppColor.colorTex.withOpacity(0.8),
            //       fontSize: 15),
            // ),
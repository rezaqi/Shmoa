import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimoa/controller/home/get_controller.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/constant/routs_name.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _simulation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, lowerBound: 0, upperBound: double.infinity);
    _simulation = SpringSimulation(
        SpringDescription(mass: 8, stiffness: 50, damping: 0), 0, 8, 8);
    _controller.animateWith(_simulation);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GetNovelsControllerImp c = Get.put(GetNovelsControllerImp());
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) => Transform.translate(
        offset: Offset(0, _controller.value),
        child: InkWell(
          onTap: () {
            Get.toNamed(AppRouts.cover, arguments: {"novel": c.data[6]});
          },
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 3.r,
                    blurRadius: 30.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
                color: AppColor.colorSec,
                borderRadius: BorderRadius.circular(20.r)),
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            height: 180.h,
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: "cover${c.data[6].id}",
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                          imageUrl: "${c.data[6].image}", fit: BoxFit.fill)),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          AppColor.colorSec.withOpacity(0),
                        ]),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                Positioned(
                  right: 10.w,
                  top: 10.h,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          c.onFav("${c.data[6].id}");
                        },
                        child: Container(
                          child: Icon(
                            Icons.favorite,
                            color: c.favList == null
                                ? Colors.white
                                : c.favList!.contains("${c.data[6].id}")
                                    ? Colors.redAccent
                                    : Colors.white,
                            size: 20.sp,
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            c.onSaved("${c.data[6].id}");
                          },
                          child: Icon(
                            Icons.bookmark,
                            size: 20.sp,
                            color: c.saveList == null
                                ? Colors.white
                                : c.saveList!.contains("${c.data[6].id}")
                                    ? Colors.black
                                    : Colors.white,
                          ))
                    ],
                  ),
                ),
                Positioned(
                  bottom: 5.h,
                  right: 10.w,
                  child: Text(
                    "${c.data[6].title}",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.8)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

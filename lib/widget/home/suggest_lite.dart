import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimoa/controller/home/get_controller.dart';
import 'package:shimoa/core/class/handling_data_view.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/constant/routs_name.dart';

class Suggest extends StatefulWidget {
  const Suggest({super.key});

  @override
  State<Suggest> createState() => _SuggestState();
}

class _SuggestState extends State<Suggest> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _simulation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, upperBound: double.infinity, lowerBound: 0);
    _simulation = SpringSimulation(
        const SpringDescription(mass: 10, stiffness: 200, damping: 1),
        0,
        10,
        100);

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
    Get.put(GetNovelsControllerImp());

    return GetBuilder<GetNovelsControllerImp>(builder: (c) {
      return HandlingDataView(
        statusRequest: c.statusRequest,
        widget: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) =>
                Transform.translate(
              offset: Offset(_controller.value, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                    5,
                    (index) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRouts.cover,
                                    arguments: {"novel": c.data[index]});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColor.colorSec,
                                    borderRadius: BorderRadius.circular(20.r)),
                                margin:
                                    EdgeInsets.only(bottom: 5.h, right: 10.w),
                                height: 200.h,
                                width: 150.w,
                                child: Hero(
                                  tag: "cover${c.data[index].id}",
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: CachedNetworkImage(
                                          imageUrl: "${c.data[index].image}",
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10.w,
                              top: 5.h,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      c.onFav("${c.data[index].id}");
                                    },
                                    child: Container(
                                      child: Icon(
                                        Icons.favorite,
                                        color: c.favList == null
                                            ? Colors.white
                                            : c.favList!.contains(
                                                    "${c.data[index].id}")
                                                ? Colors.redAccent
                                                : Colors.white,
                                        size: 20.sp,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        c.onSaved("${c.data[index].id}");
                                      },
                                      child: Icon(
                                        Icons.bookmark,
                                        size: 20.sp,
                                        color: c.saveList == null
                                            ? Colors.white
                                            : c.saveList!.contains(
                                                    "${c.data[index].id}")
                                                ? Colors.black
                                                : Colors.white,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 150.w,
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          child: Text(
                            "${c.data[index].title}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.name,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

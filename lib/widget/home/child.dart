import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimoa/controller/home/childdren_controller.dart';
import 'package:shimoa/core/class/handling_data_view.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/constant/routs_name.dart';

class ChildBit extends StatefulWidget {
  final ChildControllerImp c;
  const ChildBit({super.key, required this.c});

  @override
  State<ChildBit> createState() => _ChildBitState();
}

class _ChildBitState extends State<ChildBit>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SpringSimulation _simulation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, lowerBound: 0, upperBound: double.infinity);
    _simulation = ScrollSpringSimulation(
        SpringDescription(mass: 10, stiffness: 200, damping: 1), 0, 5, 100);
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
    return GetBuilder<ChildControllerImp>(builder: (c) {
      return HandlingDataView(
        statusRequest: c.statusRequest,
        widget: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Transform.translate(
                offset: Offset(0, -_controller.value),
                child: GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 0,
                    mainAxisExtent: 250.h,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => Column(
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
                                  borderRadius: BorderRadius.circular(20)),
                              margin: EdgeInsets.only(right: 10.w, top: 8.h),
                              height: 150.h,
                              width: 150.w,
                              child: Hero(
                                tag: "cover${c.data[index].id}",
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                        imageUrl: "${c.data[index].image}",
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10.w,
                            top: 10.h,
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
                      Text(
                        "${c.data[index].title}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.name,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              );
            }),
      );
    });
  }
}

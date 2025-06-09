import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimoa/controller/home/prophets_controller.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/constant/routs_name.dart';

class ProPhetsBit extends StatefulWidget {
  final ProphetsControllerImp c;
  const ProPhetsBit({super.key, required this.c});

  @override
  State<ProPhetsBit> createState() => _ProPhetsBitState();
}

class _ProPhetsBitState extends State<ProPhetsBit>
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
    return AnimatedBuilder(
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
                mainAxisSpacing: 10.w,
                crossAxisSpacing: 5.h,
                mainAxisExtent: 200.h,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRouts.cover,
                              arguments: {"novel": widget.c.data[index]});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.colorSec,
                              borderRadius: BorderRadius.circular(20.r)),
                          margin: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 5.w),
                          height: 160.h,
                          width: 160.w,
                          child: Hero(
                            tag: "cover${widget.c.data[index].id}",
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                    imageUrl: "${widget.c.data[index].image}",
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 5.w,
                        top: 10.h,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                widget.c.onFav("${widget.c.data[index].id}");
                              },
                              child: Container(
                                child: Icon(
                                  Icons.favorite,
                                  color: widget.c.favList == null
                                      ? Colors.white
                                      : widget.c.favList!.contains(
                                              "${widget.c.data[index].id}")
                                          ? Colors.redAccent
                                          : Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  widget.c
                                      .onSaved("${widget.c.data[index].id}");
                                },
                                child: Icon(
                                  Icons.bookmark,
                                  size: 20.sp,
                                  color: widget.c.saveList == null
                                      ? Colors.white
                                      : widget.c.saveList!.contains(
                                              "${widget.c.data[index].id}")
                                          ? Colors.black
                                          : Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${widget.c.data[index].title}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.name,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          );
        });
  }
}

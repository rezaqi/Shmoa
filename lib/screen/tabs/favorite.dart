import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shimoa/controller/controllers_app/favorite_controller.dart';
import 'package:shimoa/core/class/handling_data_view.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/widget/custom_title_pages.dart';
import 'package:shimoa/widget/fav/custom_novels.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _TopMoreState();
}

class _TopMoreState extends State<Favorite>
    with SingleTickerProviderStateMixin {
  ////////////////////////////////// animation when eter this page
  late AnimationController _controller;
  late SpringSimulation _simulation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, upperBound: double.infinity, lowerBound: 0);
    _simulation = SpringSimulation(
        SpringDescription(mass: 10, stiffness: 500, damping: 1), 100, 10, 100);
    _controller.animateWith(_simulation);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

//////////////////////end animtion

  @override
  Widget build(BuildContext context) {
    // getting favorite controller
    FavoriteControllerImp co = Get.put(FavoriteControllerImp());
    // liquid
    return LiquidPullToRefresh(
      onRefresh: () async {
        await co.onRefresh();
      },
      backgroundColor: AppColor.colorBG,
      color: AppColor.colorSec,
      animSpeedFactor: 5,
      showChildOpacityTransition: false,
      height: 100.h,
      // scaffold
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.name,
            ),
          ),
          title: const CustomTitlePages(title: "المفضلات"),
        ),
        body: GetBuilder<FavoriteControllerImp>(builder: (c) {
          // page message
          return HandlingDataView(
              statusRequest: c.statusRequest,
              // screen
              widget: CustomNovels(
                c: co,
                controller: _controller,
                doubleC: _controller.value,
              ));
        }),
      ),
    );
  }
}

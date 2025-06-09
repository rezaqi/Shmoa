import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shimoa/controller/home/childdren_controller.dart';
import 'package:shimoa/controller/home/get_controller.dart';
import 'package:shimoa/controller/home/messengers_controller.dart';
import 'package:shimoa/controller/home/prophets_controller.dart';
import 'package:shimoa/core/class/handling_data_view.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/constant/routs_name.dart';
import 'package:shimoa/widget/custom_search.dart';
import 'package:shimoa/widget/custom_title.dart';
import 'package:shimoa/widget/home/child.dart';
import 'package:shimoa/widget/home/menu.dart';
import 'package:shimoa/widget/home/messengers.dart';
import 'package:shimoa/widget/home/popular.dart';
import 'package:shimoa/widget/home/prophets.dart';
import 'package:shimoa/widget/home/suggest_lite.dart';
import 'package:shimoa/widget/home/title_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double x = 0;
  double y = 0;
  double sc = 1;
  double angel = 0;
  bool menu = false;

  @override
  build(BuildContext context) {
    GetNovelsControllerImp co = Get.put(GetNovelsControllerImp());
    ChildControllerImp cChild = Get.put(ChildControllerImp());
    MessengersControllerImp cMessage = Get.put(MessengersControllerImp());
    ProphetsControllerImp cProphet = Get.put(ProphetsControllerImp());
    return Scaffold(
        body: Stack(
      children: [
        Menu(
          ontapSuggest: () {
            co.goToSuggest();
          },
        ),
        AnimatedScale(
          scale: sc,
          duration: Duration(milliseconds: 500),
          child: AnimatedRotation(
            alignment: Alignment(x, y),
            turns: angel,
            duration: const Duration(milliseconds: 500),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.colorBG,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.r))),
              child: GetBuilder<GetNovelsControllerImp>(
                  builder: (controller) => HandlingDataView(
                        statusRequest: co.statusRequest,
                        widget: Padding(
                            padding: EdgeInsets.only(
                                top: 5.h, left: 8.w, right: 8.w),
                            child: LiquidPullToRefresh(
                              onRefresh: () async {
                                await co.initialData();
                                await cChild.initialData();
                                await cMessage.initialData();
                              },
                              backgroundColor: AppColor.colorBG,
                              color: AppColor.colorSec,
                              animSpeedFactor: 5,
                              showChildOpacityTransition: false,
                              height: 100.h,
                              child: ListView(
                                children: [
                                  CustomTitle(
                                    icon: menu
                                        ? Icons.arrow_back_ios_new_rounded
                                        : Icons.menu,
                                    ontapMenu: () {
                                      if (menu == false) {
                                        setState(() {
                                          menu = true;
                                          angel = 0.05.w;
                                          x = -1.h;
                                          y = 1.w;
                                          sc = 1.1;
                                        });
                                      } else {
                                        setState(() {
                                          menu = false;
                                          x = 0;
                                          y = 0;
                                          angel = 0;
                                          sc = 1;
                                        });
                                      }
                                    },
                                    i: controller.isSearch,
                                    ontap: () {
                                      controller.onSearch();
                                    },
                                    title: "شموع",
                                    controller: controller.textC,
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  HandlingDataView(
                                      statusRequest: controller.statusRequest,
                                      widget: controller.isSearch
                                          ? CustomSearch(
                                              c: controller,
                                            )
                                          : Column(
                                              children: [
                                                const ItemTitle(
                                                  title:
                                                      "يمكنك قرائة هذا اليوم",
                                                  showMore: false,
                                                ),
                                                const Popular(),
                                                SizedBox(
                                                  height: 40.h,
                                                ),
                                                ItemTitle(
                                                  ontap: () {
                                                    controller.goToSuggest();
                                                  },
                                                  title: "مقترحات",
                                                  showMore: true,
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                const Suggest(),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                ItemTitle(
                                                  ontap: () {
                                                    cProphet.goToProphet();
                                                  },
                                                  title: "قبل الميلاد",
                                                  showMore: true,
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                ProPhetsBit(
                                                  c: cProphet,
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                ItemTitle(
                                                  ontap: () {
                                                    Get.toNamed(AppRouts.child);
                                                  },
                                                  title: "الاطفال",
                                                  showMore: true,
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                ChildBit(
                                                  c: cChild,
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                ItemTitle(
                                                  ontap: () {
                                                    cMessage.goToMes();
                                                  },
                                                  title: "الرسل",
                                                  showMore: true,
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                MessengersBit(
                                                  c: cMessage,
                                                ),
                                                SizedBox(
                                                  height: 40.h,
                                                )
                                              ],
                                            ))
                                ],
                              ),
                            )),
                      )),
            ),
          ),
        )
      ],
    ));
  }
}

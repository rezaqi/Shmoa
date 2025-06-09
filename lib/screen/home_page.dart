import 'package:flutter/material.dart';
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
                  borderRadius: BorderRadius.circular(20)),
              child: GetBuilder<GetNovelsControllerImp>(
                  builder: (controller) => HandlingDataView(
                        statusRequest: co.statusRequest,
                        widget: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
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
                              height: 200,
                              child: ListView(
                                children: [
                                  CustomTitle(
                                    icon: menu
                                        ? Icons.arrow_back_ios_new_rounded
                                        : Icons.menu,
                                    ontapMenu: () {
                                      print("tap");
                                      print(x);

                                      if (menu == false) {
                                        print("enter");
                                        setState(() {
                                          menu = true;
                                          angel = 0.06;
                                          x = -2;
                                          y = 1;
                                          sc = 1.1;

                                          print(x);
                                        });
                                      } else {
                                        print("else");
                                        setState(() {
                                          menu = false;
                                          angel = 0;
                                          x = 0;
                                          y = 0;
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
                                    height: 40,
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
                                                const SizedBox(
                                                  height: 30,
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                ItemTitle(
                                                  ontap: () {
                                                    controller.goToSuggest();
                                                  },
                                                  title: "مقترحات",
                                                  showMore: true,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Suggest(),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                ItemTitle(
                                                  ontap: () {
                                                    cProphet.goToProphet();
                                                  },
                                                  title: "قبل الميلاد",
                                                  showMore: true,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                ProPhetsBit(
                                                  c: cProphet,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                ItemTitle(
                                                  ontap: () {
                                                    Get.toNamed(AppRouts.child);
                                                  },
                                                  title: "الاطفال",
                                                  showMore: true,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                ChildBit(
                                                  c: cChild,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                ItemTitle(
                                                  ontap: () {
                                                    cMessage.goToMes();
                                                  },
                                                  title: "الرسل",
                                                  showMore: true,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                MessengersBit(
                                                  c: cMessage,
                                                ),
                                                SizedBox(
                                                  height: Get.height / 10,
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

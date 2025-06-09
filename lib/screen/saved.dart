import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shimoa/controller/controllers_app/save_controller.dart';
import 'package:shimoa/core/class/handling_data_view.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/constant/routs_name.dart';
import 'package:shimoa/widget/custom_title_pages.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _TopMoreState();
}

class _TopMoreState extends State<Saved> with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    SaveControllerImp co = Get.put(SaveControllerImp());
    return LiquidPullToRefresh(
        onRefresh: () async {
          await co.onRefresh();
        },
        backgroundColor: AppColor.colorBG,
        color: AppColor.colorSec,
        animSpeedFactor: 5,
        showChildOpacityTransition: false,
        height: Get.height / 5,
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
              title: const CustomTitlePages(title: "المحفوظات"),
            ),
            body: GetBuilder<SaveControllerImp>(builder: (c) {
              return HandlingDataView(
                statusRequest: c.statusRequest,
                widget: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: AnimatedBuilder(
                          animation: _controller,
                          builder: (BuildContext context, Widget? child) {
                            return Transform.translate(
                              offset: Offset(0, _controller.value),
                              child: c.data.isEmpty
                                  ? const Center(
                                      child: Text(
                                        "فارغ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  : GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: c.data.isNotEmpty
                                          ? c.save!.length
                                          : 0,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 2,
                                        mainAxisSpacing: 0,
                                        mainAxisExtent: 350,
                                      ),
                                      itemBuilder: (context, index) => Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SizedBox(
                                                height: index % 2 == 0
                                                    ? Get.height / 20
                                                    : 0,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.toNamed(AppRouts.read,
                                                      arguments: {
                                                        "novel": c.data[index]
                                                      });
                                                },
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      height: Get.height / 3,
                                                      width: Get.width / 2,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 5),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppColor.colorSec,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: Image.network(
                                                          "${c.data[index].image}",
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: Get.height / 3,
                                                      width: Get.height / 2,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          gradient: LinearGradient(
                                                              begin: Alignment
                                                                  .bottomCenter,
                                                              end: Alignment
                                                                  .center,
                                                              colors: [
                                                                Colors.black
                                                                    .withOpacity(
                                                                        0.8),
                                                                Colors.black
                                                                    .withOpacity(
                                                                        0)
                                                              ])),
                                                    ),
                                                    Positioned(
                                                      bottom: 10,
                                                      right: 10,
                                                      child: Container(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        width: Get.width / 2,
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Text(
                                                          "${c.data[index].title}",
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                              fontSize: Get.size
                                                                      .height /
                                                                  50,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: AppColor
                                                                  .colorTex),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                        top: 5,
                                                        right: 10,
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              c.onRemove(
                                                                  "${c.data[index].id}");
                                                            });
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.2)),
                                                            child: Icon(
                                                                Icons
                                                                    .bookmark_remove_rounded,
                                                                size: Get.size
                                                                        .height /
                                                                    30,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                            );
                          }),
                    ),
                  ],
                ),
              );
            })));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:shimoa/controller/controllers_app/suggestion_controller.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/constant/routs_name.dart';
import 'package:shimoa/widget/custom_title_pages.dart';

class Suggests extends StatefulWidget {
  const Suggests({super.key});

  @override
  State<Suggests> createState() => _SuggestsState();
}

class _SuggestsState extends State<Suggests>
    with SingleTickerProviderStateMixin {
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
    Get.put(SuggestControllerImp());
    return GetBuilder<SuggestControllerImp>(builder: (c) {
      return Scaffold(
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
          title: CustomTitlePages(
            title: "مقترحات",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // hero here
              Container(
                margin: EdgeInsets.only(top: 10),
                child: AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.translate(
                        offset: Offset(0, _controller.value),
                        child: Column(
                          children: [
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: c.current * 10 > c.data.length
                                  ? c.data.length
                                  : c.current * 10,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 0,
                                mainAxisExtent: 360,
                              ),
                              // here is the start
                              itemBuilder: (context, index) =>
                                  SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: index % 2 == 0 ? 50 : 0,
                                    ),
                                    Stack(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed(AppRouts.cover,
                                                arguments: {
                                                  "novel": c.data[index]
                                                });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: AppColor.colorSec,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: Get.height / 3,
                                            width: Get.width / 2,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: CachedNetworkImage(
                                                    imageUrl:
                                                        "${c.data[index].image}",
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                        Positioned(
                                          right: 15,
                                          top: 10,
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  c.onFav(
                                                      "${c.data[index].id}");
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
                                                    size: Get.size.height / 30,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    c.onSaved(
                                                        "${c.data[index].id}");
                                                  },
                                                  child: Icon(
                                                    Icons.bookmark,
                                                    size: Get.size.height / 30,
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
                                      width: Get.width / 2,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      child: Text(
                                        "${c.data[index].title}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColor.name,
                                            fontSize: Get.size.height / 50,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                c.onMore();
                              },
                              child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  height: Get.height / 20,
                                  width: Get.width / 1.5,
                                  decoration: BoxDecoration(
                                      color: AppColor.colorSec,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "عرض المزيد",
                                        style: TextStyle(
                                            color: const Color.fromRGBO(
                                                242, 233, 228, 1),
                                            fontSize: Get.size.height / 40,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: AppColor.colorTex,
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}

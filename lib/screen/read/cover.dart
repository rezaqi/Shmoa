import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shimoa/controller/read/read_controller.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/constant/routs_name.dart';

class Novelcover extends StatefulWidget {
  const Novelcover({super.key});

  @override
  State<Novelcover> createState() => _NovelcoverState();
}

class _NovelcoverState extends State<Novelcover> {
  @override
  Widget build(BuildContext context) {
    // get read controller
    Get.put(ReadControllerImp());
    // current page
    int currentPage = 0;
    // liquid swipe
    return GetBuilder<ReadControllerImp>(builder: (c) {
      return LiquidSwipe(
          onPageChangeCallback: (page) {
            setState(() {
              currentPage = page;
            });

            if (currentPage == 1) {
              currentPage = 0;
              Get.offAndToNamed(AppRouts.read,
                  arguments: {"novel": c.novelsModel});
            } else {
              print(currentPage);
            }
          },
          fullTransitionValue: 500,
          slideIconWidget: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          enableLoop: false,
          positionSlideIcon: 0.5,
          pages: [
            Hero(
              tag: "cover${c.novelsModel.id}",
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: CachedNetworkImage(
                            imageUrl: "${c.novelsModel.image}",
                            fit: BoxFit.cover)),
                    Positioned(
                      right: 10,
                      top: 40,
                      child: Material(
                        color: Colors.black.withOpacity(0),
                        child: InkWell(
                          onTap: () {
                            c.onFav("${c.novelsModel.id}");
                          },
                          child: Icon(
                            Icons.favorite,
                            color: c.favList == null
                                ? Colors.white
                                : c.favList!.contains("${c.novelsModel.id}")
                                    ? Colors.redAccent
                                    : Colors.white,
                            size: Get.size.height / 25,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 80,
                      child: Material(
                        color: Colors.black.withOpacity(0),
                        child: InkWell(
                            onTap: () {
                              c.onSaved("${c.novelsModel.id}");
                            },
                            child: Icon(
                              Icons.bookmark,
                              size: Get.size.height / 25,
                              color: c.saveList == null
                                  ? Colors.white
                                  : c.saveList!.contains("${c.novelsModel.id}")
                                      ? Colors.black
                                      : Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: AppColor.colorBG,
            )
          ]);
    });
  }
}

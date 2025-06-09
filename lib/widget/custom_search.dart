import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimoa/controller/home/get_controller.dart';
import 'package:shimoa/controller/search_controller.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/constant/routs_name.dart';

class CustomSearch extends GetView<SearchMaxController> {
  GetNovelsControllerImp c;
  CustomSearch({super.key, required this.c});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchMaxController());
    return Container(
      width: 100,
      padding: EdgeInsets.only(top: 20),
      child: Column(children: [
        InkWell(
          onTap: () {
            Get.offAllNamed(AppRouts.homeAbn);
          },
          child: Container(
            alignment: Alignment.center,
            height: 30,
            width: 250,
            decoration: BoxDecoration(
                color: AppColor.colorSec,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: AppColor.colorTex,
                ),
                Text(
                  "back",
                  style: TextStyle(color: AppColor.colorTex, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        ...List.generate(
            controller.searchD.length,
            (i) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.network(
                            "${controller.searchD[i].image}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          "${controller.searchD[i].title}",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.colorTex,
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ))
      ]),
    );
  }
}

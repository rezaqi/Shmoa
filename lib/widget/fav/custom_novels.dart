import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimoa/controller/controllers_app/favorite_controller.dart';
import 'package:shimoa/core/constant/routs_name.dart';
import 'package:shimoa/widget/fav/cutom_icon.dart';
import 'package:shimoa/widget/fav/image_novel.dart';
import 'package:shimoa/widget/fav/shadow_image.dart';

import 'novel_title.dart';

class CustomNovels extends StatefulWidget {
  final Listenable controller;
  final double doubleC;
  final FavoriteControllerImp c;
  const CustomNovels({
    super.key,
    required this.controller,
    required this.doubleC,
    required this.c,
  });

  @override
  State<CustomNovels> createState() => _CustomNovelsState();
}

class _CustomNovelsState extends State<CustomNovels> {
  @override
  Widget build(BuildContext context) {
    // start
    return ListView(
      children: [
        // container widget
        Container(
          margin: EdgeInsets.only(top: 10),
          // animation container
          child: AnimatedBuilder(
              animation: widget.controller,
              builder: (BuildContext context, Widget? child) {
                // tarns form animation
                return Transform.translate(
                    offset: Offset(0, widget.doubleC),
                    child: widget.c.data.isEmpty
                        // empty widget
                        ? const Center(
                            child: Text(
                              "empty",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        // fav items
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.c.data.isNotEmpty
                                ? widget.c.k!.length
                                : 0,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 0,
                              mainAxisExtent: 350,
                            ),
                            itemBuilder: (context, index) =>
                                widget.c.data.isEmpty
                                    ? const Center(
                                        child: Text("Empty"),
                                      )
                                    : Column(
                                        children: [
                                          SizedBox(
                                            height: index % 2 == 0 ? 50 : 0,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(AppRouts.cover,
                                                  arguments: {
                                                    "novel":
                                                        widget.c.data[index]
                                                  });
                                            },
                                            child: Stack(
                                              children: [
                                                ImageNovel(
                                                  image:
                                                      "${widget.c.data[index].image}",
                                                ),
                                                // shadow
                                                const ShadowCover(),
                                                NovelTitle(
                                                    title:
                                                        "${widget.c.data[index].title}"),
                                                CustomIcon(
                                                  ontap: () {
                                                    setState(() {
                                                      widget.c.onRemove(
                                                          "${widget.c.data[index].id}");
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                          ));
              }),
        ),
      ],
    );
  }
}

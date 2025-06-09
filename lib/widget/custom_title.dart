import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimoa/core/constant/colors.dart';

class CustomTitle extends StatefulWidget {
  final String title;
  final IconData icon;
  final TextEditingController controller;
  final void Function()? ontap;
  final void Function()? ontapMenu;
  final bool i;
  const CustomTitle({
    super.key,
    required this.title,
    required this.controller,
    this.ontap,
    required this.i,
    this.ontapMenu,
    required this.icon,
  });

  @override
  State<CustomTitle> createState() => _CustomTitleState();
}

class _CustomTitleState extends State<CustomTitle> {
  bool i = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: widget.ontapMenu,
            child: Icon(
              widget.icon,
              color: Colors.white,
            ),
          ),
          Text(
            widget.title,
            style: TextStyle(
                fontSize:
                    i == false ? Get.size.height / 27 : Get.size.height / 33,
                fontWeight: FontWeight.bold,
                color: AppColor.title),
          ),
          // const SizedBox(),
          // Row(
          //   children: [
          //     i == false
          //         ? Container()
          //         : InkWell(
          //             onTap: widget.ontap,
          //             child: Icon(
          //               Icons.search,
          //               color: AppColor.title,
          //               size: i == false
          //                   ? Get.size.height / 30
          //                   : Get.size.height / 50,
          //             ),
          //           ),
          //     InkWell(
          //       onTap: () {
          //         if (i == false) {
          //           setState(() {
          //             i = true;
          //           });
          //         } else {
          //           i = false;
          //         }
          //       },
          //       child: AnimatedContainer(
          //         decoration: BoxDecoration(
          //             color: i == false
          //                 ? AppColor.colorBG
          //                 : AppColor.colorTex.withOpacity(0.9),
          //             borderRadius: BorderRadius.circular(20)),
          //         margin: EdgeInsets.only(right: 15),
          //         duration: Duration(milliseconds: 500),
          //         width: i == false ? Get.width / 40 : Get.width / 2.5,
          //         height: 40,
          //         child: TextField(
          //           onSubmitted: (value) {
          //             if (widget.ontap != null) {
          //               widget
          //                   .ontap!(); // استدعاء دالة البحث عند الضغط على زر "الصح"
          //             } // استدعاء دالة البحث عند الضغط على زر "الصح"
          //           },
          //           controller: widget.controller,
          //           enabled: i,
          //           textInputAction:
          //               TextInputAction.search, // تعيين زر "الصح" كزر الإدخال
          //           decoration: InputDecoration(
          //             border: OutlineInputBorder(borderSide: BorderSide.none),
          //             label: i == false
          //                 ? InkWell(
          //                     onTap: widget.ontap,
          //                     child: Icon(
          //                       Icons.search,
          //                       color: AppColor.title,
          //                       size: i == false
          //                           ? Get.size.height / 30
          //                           : Get.size.height / 40,
          //                     ),
          //                   )
          //                 : Container(),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          //  )
        ],
      ),
    );
  }
}

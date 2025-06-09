// import 'package:bible/core/class/colors.dart';
// import 'package:bible/widget/onbording/pagemed.dart';
// import 'package:bible/widget/onbording/pages.dart';
// import 'package:flutter/material.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';

// class Liquid extends StatefulWidget {
//   const Liquid({super.key});

//   @override
//   State<Liquid> createState() => _LiquidState();
// }

// int currentPage = 0;

// class _LiquidState extends State<Liquid> {
//   @override
//   Widget build(BuildContext context) {
//     return LiquidSwipe(
//         // onPageChangeCallback: (page) {
//         //   setState(() {
//         //     currentPage = page;
//         //   });
//         //   print(currentPage);
//         //   // if (currentPage == 3) {
//         //   //   Get.toNamed(AppRouts.home);
//         //   //  }
//         // },
//         fullTransitionValue: 500,
//         slideIconWidget: Icon(
//           Icons.arrow_forward_ios,
//           color: Colors.white,
//         ),
//         enableLoop: false,
//         positionSlideIcon: 0.5,
//         pages: [
//           Container(
//             color: AppColor.colorSec,
//             child: CustomPage(
//               image:
//                   "https://lottie.host/ba8e6e94-e073-41a6-bee1-bb6e3c76ecef/S43qQs4Z10.json",
//               title: "الخلاص",
//               description:
//                   "خلاص المسيح المقدم للبشرية التى خلقها وسقطت ولا يستطيع أحد أن ينقذها إلا المسيح الفادى",
//             ),
//           ),
//           Container(color: AppColor.colorBG, child: const PageMed()),
//           Container(
//             color: AppColor.colorAccent,
//             child: CustomPage(
//               image:
//                   "https://lottie.host/b8624c08-4ada-42ab-8d0f-742d1a1faa29/rp4GGRUEVv.json",
//               title: "الملكوت",
//               description:
//                   "ثم إعلان هذا الخلاص واضحًا فى العهد الجديد للعالم كله حتى يؤمن به ويتمتع بحياة بعد الموت وسعادة أبدية، فهو مرشد للإنسان يقوده إلى الملكوت.",
//             ),
//           ),
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: Text("data"),
//             color: AppColor.colorBG,
//           )
//         ]);
//   }
// }

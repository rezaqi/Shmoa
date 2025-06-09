import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shimoa/controller/read/audio_controller.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/core/services/services.dart';
import 'package:shimoa/initialbinding/initialbinding.dart';
import 'package:shimoa/rout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyD71RozJzUTSN0q8tHafwtsGnG8Sff-Hi4",
              appId: "1:142892875524:android:2778032e997f1c31519a51",
              messagingSenderId: "142892875524",
              projectId: "christian-novels"))
      : await Firebase.initializeApp();
  await InitialServices();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioNovelController()),
        // يمكنك إضافة المزيد من المزودين هنا
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(75.1, 160.4),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: routs,
            initialBinding: InitialBinding(),
            theme: ThemeData(
                sliderTheme: const SliderThemeData(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0)),
                appBarTheme: const AppBarTheme(
                  color: AppColor.colorBG,
                  elevation: 0,
                ),
                scaffoldBackgroundColor: AppColor.colorBG,
                fontFamily: "Rubik"),
          );
        });
  }
}

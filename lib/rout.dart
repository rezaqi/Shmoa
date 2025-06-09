import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shimoa/core/constant/routs_name.dart';
import 'package:shimoa/core/middleware/my_middleware.dart';
import 'package:shimoa/screen/abn_home.dart';
import 'package:shimoa/screen/aboutme.dart';
import 'package:shimoa/screen/child.dart';
import 'package:shimoa/screen/favorite.dart';
import 'package:shimoa/screen/home_page.dart';
import 'package:shimoa/screen/messenger.dart';
import 'package:shimoa/screen/onbording.dart';
import 'package:shimoa/screen/prophet.dart';
import 'package:shimoa/screen/read/cover.dart';
import 'package:shimoa/screen/read/read.dart';
import 'package:shimoa/screen/saved.dart';
import 'package:shimoa/screen/suggets.dart';

List<GetPage<dynamic>> routs = [
  //GetPage(name: "/", page: () => Test()),
  // GetPage(name: AppRouts.splash, page: () => const SplachScreen()),

  GetPage(
      name: "/", page: () => const OnBording(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRouts.homeAbn, page: () => const HomeAbn()),
  GetPage(name: AppRouts.home, page: () => const HomePage()),
  GetPage(name: AppRouts.cover, page: () => const Novelcover()),
  GetPage(name: AppRouts.read, page: () => const ReadPage()),
  GetPage(name: AppRouts.suggests, page: () => const Suggests()),

  GetPage(name: AppRouts.fav, page: () => const Favorite()),

  GetPage(name: AppRouts.save, page: () => const Saved()),
  GetPage(name: AppRouts.prophet, page: () => const Prophet()),
  GetPage(name: AppRouts.messanger, page: () => const Messenger()),
  GetPage(name: AppRouts.child, page: () => const Child()),
  GetPage(name: AppRouts.aboutme, page: () => const AboutMe()),
];

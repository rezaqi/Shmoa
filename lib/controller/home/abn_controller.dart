import 'package:get/get.dart';
import 'package:shimoa/screen/favorite.dart';
import 'package:shimoa/screen/home_page.dart';
import 'package:shimoa/screen/saved.dart';

abstract class AbnController extends GetxController {
  goToPage(int i);
}

class AbnControllerImp extends AbnController {
  int currentPage = 0;
  List listPage = const [
    HomePage(),
    Favorite(),
    Saved(),
  ];
  List listButton = [
    {"title": "home", "icon": "assets/icons/church.json"},
    {"title": "favorite", "icon": "assets/icons/love-heart.json"},
    {"title": "saved", "icon": "assets/icons/avatar-man.json"},
  ];

  @override
  goToPage(int i) {
    currentPage = i;
    update();
  }
}

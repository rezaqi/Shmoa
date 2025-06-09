import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutState();
}

class _AboutState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.colorSec,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.name,
            ),
          ),
        ),
        backgroundColor: AppColor.colorSec,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: Get.height / 3,
                  width: Get.width / 1.5,
                  child: Image.asset("assets/rezaqi.png")),
              SizedBox(
                height: 10,
              ),
              Text(
                "Rezeqi Adib",
                style: TextStyle(
                    fontFamily: "Monoton",
                    fontSize: 30,
                    color: AppColor.colorTex),
              ),
              SizedBox(
                height: 40,
              ),
              CustomButtomAbout(
                  title: "FaceBook",
                  color: Colors.blueAccent,
                  icon: FontAwesomeIcons.facebookF,
                  link:
                      "https://www.facebook.com/profile.php?id=100078638467499"),
              CustomButtomAbout(
                  title: "TikTok",
                  color: Color.fromARGB(255, 45, 0, 0),
                  icon: FontAwesomeIcons.tiktok,
                  link: "https://www.tiktok.com/@rezaqi_adib"),
              CustomButtomAbout(
                  title: "Youtube",
                  color: Colors.redAccent,
                  icon: FontAwesomeIcons.youtube,
                  link:
                      "https://www.youtube.com/channel/UCv8KqR1VgVvCEp41aI6L8hg"),
              CustomButtomAbout(
                  title: "Instagram",
                  color: const Color.fromARGB(255, 250, 78, 135),
                  icon: FontAwesomeIcons.instagram,
                  link: "https://www.instagram.com/rezaqiadib/"),
            ],
          ),
        ));
  }
}

class CustomButtomAbout extends StatelessWidget {
  final String title;
  final String link;
  final IconData icon;
  final Color color;
  const CustomButtomAbout(
      {super.key,
      required this.link,
      required this.icon,
      required this.color,
      required this.title});

  @override
  Widget build(BuildContext context) {
    void _launchURL() async {
      final url = Uri.parse(link);

      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return SizedBox(
      width: Get.width / 1.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: color,
            size: Get.size.height / 20,
          ),
          MaterialButton(
            onPressed: _launchURL,
            child: Container(
              width: Get.width / 2.9,
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10), right: Radius.circular(20)),
                  color: color),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: Get.size.height / 40,
                    color: AppColor.colorTex,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

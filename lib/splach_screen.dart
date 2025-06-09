import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimoa/core/constant/colors.dart';
import 'package:shimoa/screen/abn_home.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: AppColor.colorTex,
        splashIconSize: 150,
        splash: Image.asset(
          "assets/splash.png",
          fit: BoxFit.fill,
        ),
        nextScreen: const HomeAbn());
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:shimoa/controller/read/audio_controller.dart';
import 'package:shimoa/controller/read/read_controller.dart';
import 'package:shimoa/widget/read/reading.dart';
import 'package:shimoa/widget/read/title.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd(); // تحميل الإعلان عند تهيئة الصفحة
  }

  // دالة لتحميل الإعلان البيني
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId:
          "ca-app-pub-7133670066739372/7338803735", // ضع معرف الوحدة الإعلانية هنا
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          print('Interstitial ad loaded successfully.');
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('Failed to load interstitial ad: $error');
          _interstitialAd = null;
        },
      ),
    );
  }

  // دالة لعرض الإعلان البيني
  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          _loadInterstitialAd(); // تحميل إعلان جديد عند إغلاق الإعلان الحالي
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          print('Failed to show interstitial ad: $error');
          ad.dispose();
          _loadInterstitialAd(); // إعادة تحميل إعلان جديد
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    } else {
      print('Interstitial ad is not ready yet.');
    }
  }

  @override
  void dispose() {
    _interstitialAd?.dispose(); // التخلص من الموارد عند إغلاق الصفحة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AudioNovelController audioController =
        Provider.of<AudioNovelController>(context);
    return WillPopScope(
      onWillPop: () async {
        audioController.stop();
        _showInterstitialAd(); // عرض الإعلان عند الضغط على زر الرجوع
        return true;
      },
      child: Scaffold(
        body: GetBuilder<ReadControllerImp>(
          builder: (readController) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // هنا يمكنك إضافة باقي عناصر الواجهة
                        TitleRead(c: readController),
                        Reading(c: readController),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

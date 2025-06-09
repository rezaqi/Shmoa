import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdShow {
  InterstitialAd? _interstitialAd;

  void loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-7133670066739372/7338803735',
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

  void showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          loadInterstitialAd(); // إعادة تحميل الإعلان عند الإغلاق
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          print('Failed to show interstitial ad: $error');
          ad.dispose();
          loadInterstitialAd(); // إعادة تحميل الإعلان عند الفشل
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null; // تخلص من الإعلان بعد العرض
    } else {
      print('Interstitial ad is not ready yet.');
    }
  }

  void dispose() {
    _interstitialAd?.dispose(); // تنظيف الموارد
  }
}

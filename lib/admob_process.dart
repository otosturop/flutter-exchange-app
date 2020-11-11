import 'package:firebase_admob/firebase_admob.dart';

class AdmobProcess {

  static final String appIDPublish = "ca-app-pub-9897772081220519~6500084380";
  static final String appIDTest = FirebaseAdMob.testAppId;
  static final String bannerOnePublish = "ca-app-pub-9897772081220519/5942337726";
  static final String interstitialPublish = "ca-app-pub-9897772081220519/5700533252";

  static admobInitialize() {
    FirebaseAdMob.instance.initialize(appId: appIDPublish);
  }

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['Döviz Çevirici', 'Altın Çevirici', 'Döviz Hesaplayıcı'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );

  static BannerAd buildBannerAd() {
    return BannerAd(
      adUnitId: bannerOnePublish,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if(event == MobileAdEvent.loaded) {
          print("Banner installed");
        }
      },
    );
  }

  static InterstitialAd buildInterstitialAd() {
    return InterstitialAd(
      adUnitId: interstitialPublish,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }

}
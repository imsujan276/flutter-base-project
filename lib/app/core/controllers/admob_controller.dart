import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/app/utils/device_info.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobController extends GetxController {
  static AdmobController instance = Get.find();

  String iosAdsStatus = "Unknown";

  // ignore: non_constant_identifier_names
  String BANNER_AD_ANDROID = "ca-app-pub-9260672419726699/2820823359";
  // ignore: non_constant_identifier_names
  String BANNER_AD_IOS = "ca-app-pub-9260672419726699/2826646495";

  static final AdRequest request = AdRequest(
    keywords: <String>['game', 'quiz'],
    nonPersonalizedAds: true,
  );
  BannerAd? anchoredBanner;
  bool loadingAnchoredBanner = false;
  RxBool admobAdLoaded = false.obs;

  AdmobController() {
    initIosTrackingPlugin();
    loadAd();
  }

  Future<void> createAnchoredBanner() async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      Get.width.truncate(),
    );

    if (size == null) {
      admobAdLoaded.value = false;
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: Platform.isAndroid ? BANNER_AD_ANDROID : BANNER_AD_IOS,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          admobAdLoaded.value = true;
          anchoredBanner = ad as BannerAd?;
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          admobAdLoaded.value = false;
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }

  loadAd() async {
    loadingAnchoredBanner = true;
    if (Platform.isIOS) {
      if (await DeviceInfo.isIos14andAbove()) {
        if (iosAdsStatus == "TrackingStatus.authorized") {
          createAnchoredBanner();
        }
      } else {
        createAnchoredBanner();
      }
    }
    if (Platform.isAndroid) createAnchoredBanner();
  }

  Future<void> close() async {
    anchoredBanner?.dispose();
  }

  Widget getAdWidget() {
    return Container(
      color: Colors.white,
      width: anchoredBanner!.size.width.toDouble(),
      height: anchoredBanner!.size.height.toDouble(),
      child: AdWidget(ad: anchoredBanner!),
    );
  }

  Future<void> initIosTrackingPlugin() async {
    if (Platform.isIOS && await DeviceInfo.isIos14andAbove())
      initIOSTrackingPlugin();
  }

  Future<void> initIOSTrackingPlugin() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final TrackingStatus status =
          await AppTrackingTransparency.trackingAuthorizationStatus;
      iosAdsStatus = '$status';
      print(status);
      if (status == TrackingStatus.denied) return;
      // If the system can show an authorization request dialog
      if (status == TrackingStatus.notDetermined) {
        // Request system's tracking authorization dialog
        final TrackingStatus status =
            await AppTrackingTransparency.requestTrackingAuthorization();
        iosAdsStatus = '$status';

        print(status);
      }
    } on PlatformException {
      print('PlatformException was thrown');
    }
  }
}

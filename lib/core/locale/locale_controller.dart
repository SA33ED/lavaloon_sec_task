import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../databases/cache/cache_helper.dart';
import '../services/service_locator.dart';

class LocaleController extends GetxController {
  static const String _defaultLanguage = 'en';

  final RxString currentLanguage = _defaultLanguage.obs;
  final RxBool isArabic = false.obs;

  Locale get locale => Locale(currentLanguage.value);

  static const List<String> supportedLanguages = ['en', 'ar'];
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('ar', 'EG'),
  ];

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    try {
      final savedLanguage = sl<CacheHelper>().getCachedLanguage();
      currentLanguage.value = savedLanguage;
      isArabic.value = savedLanguage == 'ar';
      Get.updateLocale(Locale(savedLanguage));
    } catch (e) {
      currentLanguage.value = _defaultLanguage;
      isArabic.value = false;
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    if (!supportedLanguages.contains(languageCode)) return;

    currentLanguage.value = languageCode;
    isArabic.value = languageCode == 'ar';

    Get.updateLocale(Locale(languageCode));

    try {
      await sl<CacheHelper>().cacheLanguage(languageCode);
    } catch (e) {
      debugPrint('Error saving language: $e');
    }
  }

  void toggleLanguage() {
    final newLanguage = currentLanguage.value == 'en' ? 'ar' : 'en';
    changeLanguage(newLanguage);
  }
}



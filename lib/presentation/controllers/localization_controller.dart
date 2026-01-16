import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/core/utils/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationController extends GetxController {
  static const String localeKey = 'current_locale';
  var currentLocale = const Locale('en', 'US').obs;

  @override
  void onInit() {
    super.onInit();
    _loadLocale();
  }

  void _loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langCode = prefs.getString(localeKey);
    if (langCode != null) {
      if (langCode == 'km') {
        currentLocale.value = const Locale('km', 'KH');
      } else if (langCode == 'cn') {
        currentLocale.value = const Locale('zh', 'CN');
      } else {
        currentLocale.value = const Locale('en', 'US');
      }
    }
    Get.updateLocale(currentLocale.value);
  }

  void changeLanguage(String langCode) async {
    if (langCode == 'km') {
      currentLocale.value = const Locale('km', 'KH');
    } else if (langCode == 'cn') {
      currentLocale.value = const Locale('zh', 'CN');
    } else {
      currentLocale.value = const Locale('en', 'US');
    }

    AppLogger.logInfo("Current Locale: ${currentLocale.value}");

    Get.updateLocale(currentLocale.value);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(localeKey, langCode);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/core/shared/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var currentThemeIndex = 0.obs;
  var fontScale = 1.0.obs;

  final List<ThemeData> themes = [
    AppThemes.lightTheme,
    AppThemes.darkTheme,
  ];

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromPreferences();
  }

  Future<void> _loadThemeFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentThemeIndex.value = prefs.getInt('currentThemeIndex') ?? 0;
    fontScale.value = prefs.getDouble('fontScale') ?? 1.0;
  }

  void toggleTheme() async {
    currentThemeIndex.value = (currentThemeIndex.value + 1) % themes.length;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('currentThemeIndex', currentThemeIndex.value);

    // AppLogger.logInfo('Theme changed to ${currentThemeIndex.value}');
  }

  void updateFontScale(double scale) {
    final clampedScale = scale.clamp(1.0, 1.5);
    fontScale.value = clampedScale;
  }

  void saveFontScaleToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('fontScale', fontScale.value);
  }

  void resetFontScale() {
    updateFontScale(1.0);
    saveFontScaleToPrefs();
  }

  ThemeData get currentTheme => themes[currentThemeIndex.value];
}

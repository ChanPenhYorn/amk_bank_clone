import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:getx_mvvm_architecture/controllers/theme_controller.dart';
import 'package:getx_mvvm_architecture/core/utils/app_logger.dart';
import 'package:getx_mvvm_architecture/core/shared/app_translation.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'app.dart';
import 'flavors.dart';

void main() async {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp();

  // Pass all uncaught "fatal" errors from the framework to Crashlytics.
  if (!kDebugMode) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics.
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  logAppInfo(firebaseApp);
  AppTranslation translations = AppTranslation();
  await translations.loadTranslations();

  Get.put(ThemeController());
  runApp(App(translations: translations));
}

Future<void> logAppInfo(FirebaseApp firebaseApp) async {
  final info = await PackageInfo.fromPlatform();
  AppLogger.logInfo("🔥 App info:");
  AppLogger.logInfo("  - App Name: ${info.appName}");
  AppLogger.logInfo("  - Package Name / Bundle ID: ${info.packageName}");
  AppLogger.logInfo("  - Version: ${info.version}");
  AppLogger.logInfo("  - Build Number: ${info.buildNumber}");

  AppLogger.logInfo("🔥 Firebase info:");
  AppLogger.logInfo("  - App ID: ${firebaseApp.options.appId}");
  AppLogger.logInfo("  - Project ID: ${firebaseApp.options.projectId}");
  AppLogger.logInfo("  - API Key: ${firebaseApp.options.apiKey}");
  AppLogger.logInfo(
      "  - Messaging Sender ID: ${firebaseApp.options.messagingSenderId}");
}

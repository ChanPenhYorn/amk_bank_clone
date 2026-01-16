import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/theme_controller.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/localization_controller.dart';
import 'package:getx_mvvm_architecture/core/shared/app_translation.dart';
import 'package:getx_mvvm_architecture/routes/app_page.dart';
import 'package:getx_mvvm_architecture/routes/app_route.dart';

class App extends StatelessWidget {
  final AppTranslation translations;

  App({super.key, required this.translations});
  final routeObserver = GetObserver();
  final ThemeController themeController = Get.find();
  final LocalizationController localizationController =
      Get.put(LocalizationController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          locale: localizationController.currentLocale.value,
          fallbackLocale: const Locale(
            'en',
            'US',
          ),
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('km', 'KH'),
            Locale.fromSubtags(
                languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          translations: translations,
          title: 'AMK Banking',
          debugShowCheckedModeBanner: false,
          theme: themeController.currentTheme,
          initialRoute: AppRoutes.splash,
          getPages: AppPages.routes,
          navigatorObservers: [routeObserver],
          builder: (context, child) {
            return Obx(() => MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler:
                        TextScaler.linear(themeController.fontScale.value),
                  ),
                  child: child!,
                ));
          },
          // home: HomeScreen(),
        ));
  }
}

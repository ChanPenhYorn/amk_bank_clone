import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_mvvm_architecture/presentation/bindings/auth_binding.dart';
import 'package:getx_mvvm_architecture/presentation/bindings/location_binding.dart';
import 'package:getx_mvvm_architecture/presentation/bindings/splash_binding.dart';
import 'package:getx_mvvm_architecture/routes/app_route.dart';
import 'package:getx_mvvm_architecture/presentation/views/auth/login_screen.dart';
import 'package:getx_mvvm_architecture/presentation/views/home/home_screen.dart';
import 'package:getx_mvvm_architecture/presentation/views/home/dashboard_screen.dart';
import 'package:getx_mvvm_architecture/presentation/bindings/dashboard_binding.dart';
import 'package:getx_mvvm_architecture/presentation/views/location/location_screen.dart';
import 'package:getx_mvvm_architecture/presentation/views/splash/splash_screen.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
        name: AppRoutes.splash,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.location,
      page: () => LocationScreen(),
      binding: LocationBinding(),
    ),
  ];
}

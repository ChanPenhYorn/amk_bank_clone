import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/service_controller.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<ServiceController>(() => ServiceController());
  }
}

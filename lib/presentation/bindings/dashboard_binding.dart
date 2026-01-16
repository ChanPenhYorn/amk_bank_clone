import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/dashboard_controller.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/other_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );

    Get.lazyPut<OtherController>(
      () => OtherController(),
    );
  }
}

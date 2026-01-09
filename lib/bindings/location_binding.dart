import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/controllers/location_controller.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
  }
}

import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/location_controller.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
  }
}

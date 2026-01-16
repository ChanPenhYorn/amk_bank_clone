import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/data/models/name_model.dart';

class OtherController extends GetxController {
  Rx<NameModel> selectedCountry = NameModel(id: 0, name: '').obs;

  Rx<List<NameModel>> countryItems = Rx([
    NameModel(name: 'Brunei', id: 1),
    NameModel(name: 'Cambodia', id: 2),
    NameModel(name: 'Indonesia', id: 3),
    NameModel(name: 'Laos', id: 4),
    NameModel(name: 'Malaysia', id: 5),
    NameModel(name: 'Myanmar', id: 6),
    NameModel(name: 'Philippines', id: 7),
    NameModel(name: 'Singapore', id: 8),
    NameModel(name: 'Thailand', id: 9),
    NameModel(name: 'Vietnam', id: 10),
  ]);

  @override
  void onInit() {
    super.onInit();
    selectedCountry.value = countryItems.value[1];
  }

  void onCountryChanged(NameModel country) {
    selectedCountry.value = country;
  }
}

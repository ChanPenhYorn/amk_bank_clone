import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Observable state
  final RxSet<Marker> markers = <Marker>{}.obs;
  final RxInt selectedTabIndex = 0.obs;

  GoogleMapController? mapController;

  // Phnom Penh center coordinates
  static final Rx<LatLng> phnomPenhCenter =
      Rx<LatLng>(LatLng(11.5564, 104.9282));

  // Sample location data for different types
  final Rx<Map<String, List<LocationData>>> locations =
      Rx<Map<String, List<LocationData>>>({
    'ATMs': [
      LocationData(
          name: 'AMK ATM - Olympic Stadium',
          position: LatLng(11.5564, 104.9182),
          type: 'ATM'),
      LocationData(
          name: 'AMK ATM - Riverside',
          position: LatLng(11.5753, 104.9282),
          type: 'ATM'),
      LocationData(
          name: 'AMK ATM - Toul Kork',
          position: LatLng(11.5764, 104.8982),
          type: 'ATM'),
    ],
    'Branches': [
      LocationData(
          name: 'AMK Main Branch',
          position: LatLng(11.5464, 104.9282),
          type: 'Branch'),
      LocationData(
          name: 'AMK Olympic Branch',
          position: LatLng(11.5564, 104.9082),
          type: 'Branch'),
    ],
    'Agents': [
      LocationData(
          name: 'AMK Agent - Chip Mong 271',
          position: LatLng(11.5264, 104.9182),
          type: 'Agent'),
      LocationData(
          name: 'AMK Agent - Deok Bak CoCo',
          position: LatLng(11.5464, 104.9382),
          type: 'Agent'),
    ],
    'Merchants': [
      LocationData(
          name: 'AMK Merchant - Olympic Market',
          position: LatLng(11.5664, 104.9182),
          type: 'Merchant'),
    ],
  });

  final List<String> tabCategories = [
    'ATMs',
    'Branches',
    'Agents',
    'Merchants'
  ];

  @override
  void onInit() {
    super.onInit();
    updateMarkers('ATMs'); // Initialize with ATMs
  }

  @override
  void onClose() {
    mapController?.dispose();
    super.onClose();
  }

  void onTabChanged(int index) {
    selectedTabIndex.value = index;
    updateMarkers(tabCategories[index]);
  }

  void updateMarkers(String category) {
    markers.clear();
    final locationList = locations.value[category] ?? [];

    for (var location in locationList) {
      markers.add(
        Marker(
          markerId: MarkerId(location.name),
          position: location.position,
          infoWindow: InfoWindow(
            title: location.name,
            snippet: location.type,
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            _getMarkerColor(location.type),
          ),
        ),
      );
    }
    update();
  }

  double _getMarkerColor(String type) {
    switch (type) {
      case 'ATM':
        return BitmapDescriptor.hueRose;
      case 'Branch':
        return BitmapDescriptor.hueViolet;
      case 'Agent':
        return BitmapDescriptor.hueBlue;
      case 'Merchant':
        return BitmapDescriptor.hueOrange;
      default:
        return BitmapDescriptor.hueRed;
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onNearMeTapped() {
    // TODO: Implement "Near Me" functionality
    // This would typically get user's current location and center map
  }

  void onSearchTapped() {
    // TODO: Implement search functionality
  }
}

class LocationData {
  final String name;
  final LatLng position;
  final String type;

  LocationData({
    required this.name,
    required this.position,
    required this.type,
  });
}

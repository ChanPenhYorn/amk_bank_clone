// lib/views/location/location_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/core/shared/app_font.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:getx_mvvm_architecture/core/utils/app_colors.dart';
import 'package:getx_mvvm_architecture/controllers/location_controller.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController controller = Get.find<LocationController>();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          title: Text(
            'Locate AMK',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: controller.onSearchTapped,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              color: AppColors.amkPrimary,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: TabBar(
                  labelPadding: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  onTap: controller.onTabChanged,
                  labelColor: Colors.white,
                  unselectedLabelColor: AppColors.amkPrimary,
                  indicator: BoxDecoration(
                    color: AppColors.amkPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  dividerColor: Colors.transparent,
                  indicatorPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: AppFont.regular(fontSize: FontSize.medium),
                  unselectedLabelStyle:
                      AppFont.regular(fontSize: FontSize.medium),
                  tabs: [
                    Tab(
                      height: 40,
                      text: 'ATMs',
                    ),
                    Tab(
                      height: 40,
                      text: 'Branches',
                    ),
                    Tab(
                      height: 40,
                      text: 'Agents',
                    ),
                    Tab(
                      height: 40,
                      text: 'Merchants',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: AppColors.amkPrimary,
              ),
            ),
            // Google Map
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Obx(
                  () => GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LocationController.phnomPenhCenter.value,
                      zoom: 13,
                    ),
                    markers: controller.markers.toSet(),
                    onMapCreated: controller.onMapCreated,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: false,
                  ),
                )),

            // Near Me Button
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton.extended(
                onPressed: controller.onNearMeTapped,
                backgroundColor: Colors.white,
                icon: Icon(Icons.near_me, color: AppColors.amkPrimary),
                label: Text(
                  'Near Me',
                  style: TextStyle(
                    color: AppColors.amkPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

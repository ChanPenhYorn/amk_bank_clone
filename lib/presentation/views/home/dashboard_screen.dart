// lib/views/home/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/theme_controller.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/localization_controller.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/dashboard_controller.dart';
import 'package:getx_mvvm_architecture/core/shared/app_string.dart';
import 'package:getx_mvvm_architecture/core/shared/extensions.dart';
import 'package:getx_mvvm_architecture/r.dart';
import 'package:getx_mvvm_architecture/presentation/views/home/home_view.dart';
import 'package:getx_mvvm_architecture/presentation/views/home/cards_view.dart';
import 'package:getx_mvvm_architecture/presentation/views/home/scan_view.dart';
import 'package:getx_mvvm_architecture/presentation/views/home/chat_view.dart';
import 'package:getx_mvvm_architecture/presentation/views/home/others_view.dart';

class DashboardScreen extends GetView<DashboardController> {
  DashboardScreen({super.key});

  final ThemeController _themeController = Get.find();
  final LocalizationController _localizationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      _localizationController.currentLocale.value;
      final selectedIndex = controller.selectedIndex.value;

      return Scaffold(
        backgroundColor: context.colors.surface,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              Expanded(
                child: IndexedStack(
                  index: selectedIndex,
                  children: [
                    HomeView(),
                    CardsView(),
                    ScanView(),
                    ChatView(),
                    OthersView(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavBar(context, selectedIndex),
      );
    });
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AssetImages.amkNoBg, height: 40),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  context.isDarkMode
                      ? Icons.wb_sunny_outlined
                      : Icons.nightlight_outlined,
                  size: 24,
                ),
                onPressed: () => _themeController.toggleTheme(),
                color: context.colors.onSurface,
              ),
              IconButton(
                icon: Icon(Icons.notifications_outlined, size: 24),
                onPressed: () {},
                color: context.colors.onSurface,
              ),
              IconButton(
                icon: Icon(Icons.person_outline, size: 24),
                onPressed: () {},
                color: context.colors.onSurface,
              ),
              SizedBox(width: 4),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child:
                    Icon(Icons.qr_code_scanner, color: Colors.white, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context, int selectedIndex) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
            color: context.colors.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, -5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(context, Icons.home, AppString.home.tr,
                  selectedIndex == 0, 0),
              _buildNavItem(context, Icons.credit_card_outlined,
                  AppString.cards.tr, selectedIndex == 1, 1),
              SizedBox(width: 60),
              _buildNavItem(context, Icons.chat_bubble_outline,
                  AppString.chat.tr, selectedIndex == 3, 3),
              _buildNavItem(context, Icons.grid_view, AppString.others.tr,
                  selectedIndex == 4, 4),
            ],
          ),
        ),
        Positioned(
          top: 8,
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: () => controller.changeIndex(2),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: context.colors.primary.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_scanner,
                      color: Colors.white,
                      size: 32,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label,
      bool isActive, int index) {
    final color = isActive
        ? context.colors.primary
        : context.colors.onSurface.withValues(alpha: 0.6);

    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: 26,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: isActive
                  ? ThemeContext(context).textTheme.labelSmall?.copyWith(
                      fontSize: 11, color: color, fontWeight: FontWeight.bold)
                  : ThemeContext(context).textTheme.labelSmall?.copyWith(
                      fontSize: 11,
                      color: color,
                      fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

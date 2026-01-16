// lib/views/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/core/shared/app_string.dart';
import 'package:getx_mvvm_architecture/core/utils/app_colors.dart';
import 'package:getx_mvvm_architecture/controllers/localization_controller.dart';
import 'package:getx_mvvm_architecture/r.dart';
import 'package:getx_mvvm_architecture/routes/app_route.dart';
import 'package:getx_mvvm_architecture/views/auth/register_screen.dart';
import 'package:getx_mvvm_architecture/core/shared/app_font.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if we are in dark mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final backgroundDecoration = BoxDecoration(
      image: DecorationImage(
          image: AssetImage(AssetImages.splash),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Container(
              decoration: backgroundDecoration,
            ),
          ),

          // 1.5. White-to-pink gradient overlay at top and fade to white bottom
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.amkPrimary.withValues(alpha: 0.6),
                    Colors.transparent,
                    Colors.white.withValues(alpha: 0.8),
                    Colors.white,
                  ],
                  stops: [0.0, 0.3, 0.5, 0.6],
                ),
              ),
            ),
          ),

          // 2. Main Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header (Logo + Languages)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo
                      Image.asset(AssetImages.amkNoBg,
                          height: 60, width: 80, fit: BoxFit.contain),

                      // Language Selector Pill
                      Obx(() {
                        final localizationController =
                            Get.find<LocalizationController>();
                        final currentLang = localizationController
                            .currentLocale.value.languageCode;

                        return Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    localizationController.changeLanguage('en'),
                                child: _buildLanguageOption(
                                    AssetImages.enFlag, "EN",
                                    isActive: currentLang == 'en'),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    localizationController.changeLanguage('cn'),
                                child: _buildLanguageOption(
                                    AssetImages.cnFlag, "中文",
                                    isActive: currentLang == 'zh'),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    localizationController.changeLanguage('km'),
                                child: _buildLanguageOption(
                                    AssetImages.kmFlag, "ខ្មែរ",
                                    isActive: currentLang == 'km'),
                              ),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),

                Spacer(), // Push content down

                // Login Card / Action Area
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Color(0xFF2C2C2C) : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 15,
                        offset: Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      // Login Button (Sign In)
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.amkPrimary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.offAllNamed(AppRoutes.dashboard);
                          },
                          child: Text(
                            AppString.signIn.tr,
                            style: AppFont.bold(
                                fontSizeValue: 18, color: Colors.white),
                          ),
                        ),
                      ),

                      SizedBox(height: 12),

                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: AppColors.amkPrimary
                                    .withValues(alpha: 0.5)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            AppString.signUp.tr,
                            style: AppFont.bold(
                                color: AppColors.amkPrimary, fontSizeValue: 18),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // Divider
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey.shade300)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(AppString.noAccountMsg.tr,
                                style: AppFont.regular(
                                    fontSizeValue: 13,
                                    color: Colors.grey.shade600)),
                          ),
                          Expanded(child: Divider(color: Colors.grey.shade300)),
                        ],
                      ),

                      SizedBox(height: 20),

                      // Self Account Opening Button
                      GestureDetector(
                        onTap: () {
                          Get.to(() => RegisterScreen());
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(AppString.selfAccountOpening.tr,
                                style: AppFont.bold(
                                    color: AppColors.amkPrimary,
                                    fontSizeValue: 16)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Spacer(),

                // Footer
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFooterItem(
                        Icons.chat_bubble_outline,
                        AppString.chat.tr,
                        Colors.black,
                      ),
                      _buildFooterItem(
                        Icons.call_outlined,
                        AppString.contactUs.tr,
                        Colors.black,
                      ),
                      _buildFooterItem(
                        Icons.info_outline,
                        AppString.aboutAmk.tr,
                        Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String flagPath, String label,
      {bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isActive
              ? [
                  BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 5,
                      offset: Offset(0, 2))
                ]
              : null,
        ),
        child: Row(
          children: [
            Image.asset(flagPath, height: 20, width: 20),
            // if (isActive) ...[
            //   SizedBox(width: 4),
            //   Text(label,
            //       style: TextStyle(
            //           color: Colors.black87,
            //           fontSize: 12,
            //           fontWeight: FontWeight.w500)),
            // ]

            SizedBox(width: 4),
            Text(label,
                style:
                    AppFont.medium(color: Colors.black87, fontSizeValue: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterItem(IconData icon, String label, Color color,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 105,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: Offset(0, 4))
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.amkPrimary, size: 28),
            SizedBox(height: 8),
            Text(label,
                style:
                    AppFont.medium(color: Colors.black87, fontSizeValue: 13)),
          ],
        ),
      ),
    );
  }
}

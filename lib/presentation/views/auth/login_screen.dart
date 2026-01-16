// lib/views/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/core/shared/app_string.dart';
import 'package:getx_mvvm_architecture/core/utils/app_colors.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/localization_controller.dart';
import 'package:getx_mvvm_architecture/r.dart';
import 'package:getx_mvvm_architecture/routes/app_route.dart';
import 'package:getx_mvvm_architecture/presentation/views/auth/register_screen.dart';
import 'package:getx_mvvm_architecture/core/shared/extensions.dart';
import 'package:getx_mvvm_architecture/presentation/widgets/app_button_widget.dart';

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
      backgroundColor: context.colors.surface,
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

          // 1.5. White-to-pink gradient overlay at top and fade to surface bottom
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.amkPrimary.withValues(alpha: 0.6),
                    Colors.transparent,
                    context.colors.surface.withValues(alpha: 0.8),
                    context.colors.surface,
                  ],
                  stops: const [0.0, 0.3, 0.5, 0.6],
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                            color:
                                context.colors.surface.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    localizationController.changeLanguage('en'),
                                child: _buildLanguageOption(
                                    context, AssetImages.enFlag, "EN",
                                    isActive: currentLang == 'en'),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    localizationController.changeLanguage('cn'),
                                child: _buildLanguageOption(
                                    context, AssetImages.cnFlag, "中文",
                                    isActive: currentLang == 'zh'),
                              ),
                              GestureDetector(
                                onTap: () =>
                                    localizationController.changeLanguage('km'),
                                child: _buildLanguageOption(
                                    context, AssetImages.kmFlag, "ខ្មែរ",
                                    isActive: currentLang == 'km'),
                              ),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),

                const Spacer(), // Push content down

                // Login Card / Action Area
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withValues(alpha: isDarkMode ? 0.3 : 0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      // Login Button (Sign In)
                      AppPrimaryButton(
                        text: AppString.signIn.tr,
                        onPressed: () {
                          Get.offAllNamed(AppRoutes.dashboard);
                        },
                        width: double.infinity,
                      ),

                      const SizedBox(height: 12),

                      // Sign Up Button
                      AppOutlineButton(
                        text: AppString.signUp.tr,
                        onPressed: () {},
                        width: double.infinity,
                      ),

                      const SizedBox(height: 20),

                      // Divider
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                                  color: context.colors.outlineVariant)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(AppString.noAccountMsg.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: 13,
                                        color:
                                            context.colors.onSurfaceVariant)),
                          ),
                          Expanded(
                              child: Divider(
                                  color: context.colors.outlineVariant)),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Self Account Opening Button
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const RegisterScreen());
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: context.colors.surfaceVariant,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(AppString.selfAccountOpening.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: AppColors.amkPrimary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Footer
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFooterItem(
                        context,
                        Icons.chat_bubble_outline,
                        AppString.chat.tr,
                      ),
                      _buildFooterItem(
                        context,
                        Icons.call_outlined,
                        AppString.contactUs.tr,
                      ),
                      _buildFooterItem(
                        context,
                        Icons.info_outline,
                        AppString.aboutAmk.tr,
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

  Widget _buildLanguageOption(
      BuildContext context, String flagPath, String label,
      {bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isActive ? context.colors.surface : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isActive
              ? [
                  BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 2))
                ]
              : null,
        ),
        child: Row(
          children: [
            Image.asset(flagPath, height: 20, width: 20),
            const SizedBox(width: 4),
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: context.colors.onSurface, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterItem(BuildContext context, IconData icon, String label,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 105,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: context.colors.surface,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4))
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.amkPrimary, size: 28),
            const SizedBox(height: 8),
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: context.colors.onSurface, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

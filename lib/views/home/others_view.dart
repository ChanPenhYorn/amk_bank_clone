import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/controllers/localization_controller.dart';
import 'package:getx_mvvm_architecture/controllers/theme_controller.dart';
import 'package:getx_mvvm_architecture/core/shared/extensions.dart';
import 'package:getx_mvvm_architecture/core/utils/app_colors.dart';

class OthersView extends StatelessWidget {
  const OthersView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final LocalizationController localizationController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Banking App Theme & Settings"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
                themeController.currentTheme.brightness == Brightness.dark
                    ? Icons.light_mode
                    : Icons.dark_mode),
            onPressed: () => themeController.toggleTheme(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader("Language / ភាសា / 语言"),
            const Gap(12),
            _buildLanguageSelector(context, localizationController),
            const Gap(24),
            Obx(() => _buildSectionHeader(
                "Font Scale: ${themeController.fontScale.value.toStringAsFixed(1)}x")),
            const Gap(12),
            _buildFontScaleSelector(context, themeController),
            const Gap(8),
            Text(
              "Font: Inter (All text uses Inter font with custom scaling)",
              style: ThemeContext(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey),
            ),
            const Gap(24),
            _buildWelcomeCard(),
            const Gap(24),
            _buildSectionHeader("Color Palette"),
            const Gap(12),
            _buildColorPalette(),
            const Gap(24),
            _buildTypographyPreview(context),
            const Gap(24),
            _buildSectionHeader("Custom Buttons"),
            const Gap(12),
            _buildButtonsSection(context),
            const Gap(24),
            _buildSectionHeader("Custom Input Fields"),
            const Gap(12),
            _buildInputFieldsSection(context),
            const Gap(24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildLanguageSelector(
      BuildContext context, LocalizationController controller) {
    return Obx(() {
      final currentLocale = controller.currentLocale.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildLanguageCard(
                context,
                "ខ្មែរ",
                "Khmer",
                isSelected: currentLocale.languageCode == 'km',
                onTap: () => controller.changeLanguage('km'),
              ),
              const Gap(12),
              _buildLanguageCard(
                context,
                "中文",
                "Chinese",
                isSelected: currentLocale.languageCode == 'zh',
                onTap: () => controller.changeLanguage('cn'),
              ),
              const Gap(12),
              _buildLanguageCard(
                context,
                "English",
                "EN",
                isSelected: currentLocale.languageCode == 'en',
                onTap: () => controller.changeLanguage('en'),
              ),
            ],
          ),
          const Gap(8),
          Text(
            "Current: ${currentLocale.languageCode}_${currentLocale.countryCode ?? ''}",
            style: ThemeContext(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.grey),
          ),
        ],
      );
    });
  }

  Widget _buildLanguageCard(BuildContext context, String title, String sub,
      {required bool isSelected, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.amkPrimary : context.colors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? AppColors.amkPrimary
                  : Colors.grey.withOpacity(0.3),
            ),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              const Gap(4),
              Text(
                sub,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected ? Colors.white70 : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFontScaleSelector(
      BuildContext context, ThemeController controller) {
    return Obx(() => Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  if (controller.fontScale.value > 0.5) {
                    controller
                        .updateFontScale(controller.fontScale.value - 0.1);
                  }
                },
                icon: const Icon(Icons.remove),
              ),
              Expanded(
                child: Slider(
                  value: controller.fontScale.value,
                  min: 1,
                  max: 1.5,
                  divisions: 10,
                  activeColor: AppColors.amkPrimary,
                  onChanged: (value) => controller.updateFontScale(value),
                  onChangeEnd: (value) => controller.saveFontScaleToPrefs(),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (controller.fontScale.value < 2.0) {
                    controller
                        .updateFontScale(controller.fontScale.value + 0.1);
                  }
                },
                icon: const Icon(Icons.add),
              ),
              IconButton(
                onPressed: () => controller.resetFontScale(),
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
        ));
  }

  Widget _buildWelcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [AppColors.amkGradientStart, AppColors.amkGradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Column(
        children: [
          Text(
            "Welcome to Banking App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Gap(8),
          Text(
            "Custom Gradient Background",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorPalette() {
    return Column(
      children: [
        _buildColorItem("Primary", AppColors.amkPrimary),
        _buildColorItem("Primary Light", AppColors.amkPrimary.withOpacity(0.6)),
        _buildColorItem("Primary Dark", AppColors.amkGradientEnd),
      ],
    );
  }

  Widget _buildColorItem(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const Gap(16),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildTypographyPreview(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Display Large",
              style: ThemeContext(context).textTheme.displayLarge),
          Text("Headline Medium",
              style: ThemeContext(context).textTheme.headlineMedium),
          Text("Title Large",
              style: ThemeContext(context).textTheme.titleLarge),
          Text("Body Large", style: ThemeContext(context).textTheme.bodyLarge),
          Text("Body Medium",
              style: ThemeContext(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildButtonsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          _buildButton(
            "Primary Button",
            backgroundColor: AppColors.amkPrimary,
            textColor: Colors.white,
          ),
          const Gap(12),
          _buildButton(
            "Primary Disabled",
            backgroundColor: Colors.grey.shade400,
            textColor: Colors.white70,
          ),
          const Gap(12),
          _buildButton(
            "With Icon",
            backgroundColor: AppColors.amkPrimary,
            textColor: Colors.white,
            icon: Icons.login,
          ),
          const Gap(12),
          _buildButton(
            "Outline Button",
            backgroundColor: Colors.white,
            textColor: AppColors.amkPrimary,
            borderColor: AppColors.amkPrimary,
          ),
          const Gap(12),
          _buildButton(
            "Outline Disabled",
            backgroundColor: Colors.white,
            textColor: Colors.grey.shade400,
            borderColor: Colors.grey.shade300,
          ),
          const Gap(12),
          _buildButton(
            "With Icon",
            backgroundColor: Colors.white,
            textColor: AppColors.amkPrimary,
            borderColor: AppColors.amkPrimary,
            icon: Icons.send,
            iconTrailing: true,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text,
      {required Color backgroundColor,
      required Color textColor,
      Color? borderColor,
      IconData? icon,
      bool iconTrailing = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null && !iconTrailing) ...[
            Icon(icon, color: textColor, size: 20),
            const Gap(8),
          ],
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          if (icon != null && iconTrailing) ...[
            const Spacer(),
            Icon(icon, color: textColor, size: 20),
          ],
        ],
      ),
    );
  }

  Widget _buildInputFieldsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          _buildTextField(
            hintText: "លេខសម្ងាត់ ឬ ខ្មែរ",
            prefixIcon: Icons.search,
            suffixIcon: Icons.visibility_off,
          ),
          const Gap(12),
          _buildTextField(
            hintText: "Email",
            prefixIcon: Icons.email,
          ),
          const Gap(12),
          _buildTextField(
            hintText: "Phone Number",
            prefixIcon: Icons.phone,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required String hintText, IconData? prefixIcon, IconData? suffixIcon}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
        suffixIcon:
            suffixIcon != null ? Icon(suffixIcon, color: Colors.grey) : null,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.amkPrimary),
        ),
      ),
    );
  }
}

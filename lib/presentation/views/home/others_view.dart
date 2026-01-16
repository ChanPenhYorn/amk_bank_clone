import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/localization_controller.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/other_controller.dart';
import 'package:getx_mvvm_architecture/presentation/controllers/theme_controller.dart';
import 'package:getx_mvvm_architecture/core/shared/extensions.dart';
import 'package:getx_mvvm_architecture/core/utils/app_colors.dart';
import 'package:getx_mvvm_architecture/core/shared/app_string.dart';
import 'package:getx_mvvm_architecture/data/models/name_model.dart';
import 'package:getx_mvvm_architecture/presentation/widgets/app_button_widget.dart';
import 'package:getx_mvvm_architecture/presentation/widgets/app_dropdown_button.dart';
import 'package:getx_mvvm_architecture/presentation/widgets/app_textformfield_widget.dart';

class OthersView extends StatelessWidget {
  const OthersView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final LocalizationController localizationController = Get.find();

    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController userNameController = TextEditingController();

    final OtherController otherController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.bankingAppThemeSettings.tr),
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
            _buildSectionHeader(AppString.language.tr),
            const Gap(12),
            _buildLanguageSelector(context, localizationController),
            const Gap(24),
            Obx(() => _buildSectionHeader(
                "${AppString.fontScale.tr}: ${themeController.fontScale.value.toStringAsFixed(1)}x")),
            const Gap(12),
            _buildFontScaleSelector(context, themeController),

            const Gap(8),
            Text(
              AppString.fontInterDescription.tr,
              style: ThemeContext(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey),
            ),
            const Gap(24),
            _buildWelcomeCard(),
            const Gap(24),
            _buildSectionHeader(AppString.colorPalette.tr),
            const Gap(12),
            _buildColorPalette(),
            const Gap(24),
            _buildTypographyPreview(context),
            const Gap(24),
            _buildSectionHeader(AppString.customButtons.tr),
            const Gap(12),
            _buildButtonsSection(context),
            const Gap(24),
            _buildSectionHeader(AppString.customInputFields.tr),
            const Gap(12),
            // Custom Input Fields Card
            _buildCustomField(context, passwordController, emailController,
                phoneNumberController, userNameController),

            const Gap(24),

            const Gap(24),
            _buildSectionHeader(AppString.customDropdownButton.tr),
            const Gap(12),

            // customd dropdown button
            Obx(() => Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  ),
                  child: AppDropdownButtonWidget(
                    backgroundColor: context.colors.surface,
                    items: otherController.countryItems.value,
                    onChanged: (value) {
                      if (value != null) {
                        otherController.onCountryChanged(value);
                      }
                    },
                    selectedValue: otherController.selectedCountry.value,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Card _buildCustomField(
      BuildContext context,
      TextEditingController passwordController,
      TextEditingController emailController,
      TextEditingController phoneNumberController,
      TextEditingController userNameController) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Custom Input Fields',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            AppTextformfieldWidget(
              label: 'លេខសម្ងាត់ ឬ ខ្មែរ',
              hintText: '******',
              prefixIcon: Icon(Icons.lock,
                  color: Theme.of(context).colorScheme.onSurface),
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 16),
            AppTextformfieldWidget(
              label: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email,
                  color: Theme.of(context).colorScheme.onSurface),
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            const SizedBox(height: 16),
            AppTextformfieldWidget(
              label: 'Phone Number',
              hintText: 'Enter phone number',
              prefixIcon: Icon(Icons.phone,
                  color: Theme.of(context).colorScheme.onSurface),
              keyboardType: TextInputType.phone,
              controller: phoneNumberController,
            ),
            const Gap(16),
            AppTextformfieldWidget(
              label: 'With suffix icon',
              hintText: 'With suffix icon',
              prefixIcon: Icon(Icons.account_circle,
                  color: Theme.of(context).colorScheme.onSurface),
              suffixIcon: Icon(Icons.close,
                  color: Theme.of(context).colorScheme.onSurface),
              keyboardType: TextInputType.phone,
              controller: userNameController,
            ),
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
            "${AppString.current.tr}: ${currentLocale.languageCode}_${currentLocale.countryCode ?? ''}",
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
                  divisions: 5,
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
      child: Column(
        children: [
          Text(
            AppString.welcomeBankingApp.tr,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(8),
          Text(
            AppString.customGradientBackground.tr,
            style: const TextStyle(
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
        _buildColorItem(AppString.primary.tr, AppColors.amkPrimary),
        _buildColorItem(
            AppString.primaryLight.tr, AppColors.amkPrimary.withOpacity(0.6)),
        _buildColorItem(AppString.primaryDark.tr, AppColors.amkGradientEnd),
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
          Text(AppString.typographyPreview.tr,
              style: ThemeContext(context).textTheme.titleLarge),
          const Gap(8),
          Text(AppString.displayLarge.tr,
              style: ThemeContext(context).textTheme.displayLarge),
          Text(AppString.headlineMedium.tr,
              style: ThemeContext(context).textTheme.headlineMedium),
          Text(AppString.titleLarge.tr,
              style: ThemeContext(context).textTheme.titleLarge),
          Text(AppString.bodyLarge.tr,
              style: ThemeContext(context).textTheme.bodyLarge),
          Text(AppString.bodyMedium.tr,
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
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Custom Buttons',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            AppPrimaryButton(
              text: 'Primary Button',
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            AppPrimaryButton(
              text: 'Primary Disabled',
              onPressed: null,
            ),
            const SizedBox(height: 8),
            AppPrimaryButton(
              text: 'With Icon',
              icon: Icons.login,
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            AppPrimaryButton(
              text: 'Loading',
              isLoading: true,
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            AppOutlineButton(
              text: 'Outline Button',
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            AppOutlineButton(
              text: 'Outline Disabled',
              onPressed: null,
            ),
            const SizedBox(height: 8),
            AppOutlineButton(
              text: 'With Icon',
              icon: Icons.send,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

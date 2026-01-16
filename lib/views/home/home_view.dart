import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/core/shared/app_string.dart';
import 'package:getx_mvvm_architecture/core/utils/app_colors.dart';
import 'package:getx_mvvm_architecture/core/utils/extensions.dart';
import 'package:getx_mvvm_architecture/core/shared/app_font.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildGreetingCard(context),
          _buildMainFeaturesGrid(context),
          const SizedBox(height: 16),
          _buildQuickActionButtons(context),
          const SizedBox(height: 24),
          _buildExploreFeaturesSection(context),
          const SizedBox(height: 24),
          _buildPromotionsSection(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildGreetingCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                image: NetworkImage('https://i.pravatar.cc/150?u=mary_doe'),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            "${AppString.goodMorning.tr}, Mary Doe!",
            style: AppFont.semiBold(
              fontSizeValue: 15,
              color: context.colors.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainFeaturesGrid(BuildContext context) {
    final features = [
      {
        'icon': Icons.account_balance_wallet_outlined,
        'label': AppString.accounts
      },
      {'icon': Icons.list_alt_outlined, 'label': AppString.payments},
      {'icon': Icons.sync_alt, 'label': AppString.localTransfer},
      {'icon': Icons.access_time, 'label': AppString.history},
      {'icon': Icons.phone_android, 'label': AppString.phoneTopUp},
      {'icon': Icons.public, 'label': AppString.overseasTransfer},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          return _buildFeatureItem(
            context,
            features[index]['icon'] as IconData,
            features[index]['label'] as String,
          );
        },
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: context.colors.primary,
            size: 32,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label.tr,
          textAlign: TextAlign.center,
          style: AppFont.medium(
            fontSizeValue: 12,
            color: context.colors.onSurface.withOpacity(0.8),
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildQuickActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.compare_arrows, size: 20),
              label: Text(AppString.fastTransfer.tr,
                  style: AppFont.semiBold(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.amkGradientStart,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_2, size: 20),
              label: Text(AppString.fastPayment.tr,
                  style: AppFont.semiBold(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3498DB),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExploreFeaturesSection(BuildContext context) {
    final exploreFeatures = [
      {
        'icon': Icons.stars,
        'label': AppString.myPoints,
        'color': const Color(0xFFF1C40F)
      },
      {
        'icon': Icons.request_quote,
        'label': AppString.loanRequest,
        'color': const Color(0xFF1ABC9C)
      },
      {
        'icon': Icons.account_balance,
        'label': AppString.creditBureauCambodia,
        'color': const Color(0xFF27AE60)
      },
      {
        'icon': Icons.savings,
        'label': AppString.goalSavings,
        'color': const Color(0xFF2980B9)
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppString.exploreFeatures.tr,
                style: AppFont.bold(
                  fontSizeValue: 16,
                  color: context.colors.onSurface,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(AppString.seeAll.tr,
                        style: AppFont.medium(
                            color: context.colors.primary, fontSizeValue: 14)),
                    Icon(Icons.chevron_right,
                        color: context.colors.primary, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 127,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: exploreFeatures.length,
            itemBuilder: (context, index) {
              return Container(
                width: 75,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: context.colors.surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: (exploreFeatures[index]['color'] as Color)
                            .withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        exploreFeatures[index]['icon'] as IconData,
                        color: exploreFeatures[index]['color'] as Color,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${exploreFeatures[index]['label']}'.tr,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppFont.medium(
                          fontSizeValue: 10,
                          color: context.colors.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPromotionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            AppString.promotions.tr,
            style: AppFont.bold(
              fontSizeValue: 16,
              color: context.colors.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 160,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                context.colors.primary,
                context.colors.primary.withOpacity(0.7)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "AMK UNIONPAY",
                      style: AppFont.bold(
                        color: Colors.white,
                        fontSizeValue: 12,
                      ),
                    ),
                    Text(
                      "1% CASHBACK",
                      style: AppFont.bold(
                        color: Colors.white,
                        fontSizeValue: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

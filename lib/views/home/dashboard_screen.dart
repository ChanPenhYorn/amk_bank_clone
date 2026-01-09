// lib/views/home/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:getx_mvvm_architecture/core/utils/app_colors.dart';
import 'package:getx_mvvm_architecture/r.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF1E1E1E) : Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(isDarkMode),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 16),

                    // Greeting Card
                    _buildGreetingCard(isDarkMode),

                    // SizedBox(height: 20),

                    // Main Features Grid (6 items)
                    _buildMainFeaturesGrid(isDarkMode),

                    SizedBox(height: 16),

                    // Fast Transfer & Fast Payment Buttons
                    _buildQuickActionButtons(isDarkMode),

                    SizedBox(height: 24),

                    // Explore Features Section
                    _buildExploreFeaturesSection(isDarkMode),

                    SizedBox(height: 24),

                    // Promotions Section
                    _buildPromotionsSection(isDarkMode),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(isDarkMode),
    );
  }

  Widget _buildHeader(bool isDarkMode) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      // color: isDarkMode ? Color(0xFF2C2C2C) : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // AMK Logo
          Image.asset(AssetImages.amkNoBg, height: 50, width: 50),

          // Right Icons
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_outlined),
                onPressed: () {},
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
              IconButton(
                icon: Icon(Icons.person_outline),
                onPressed: () {},
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.amkPrimary,
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

  Widget _buildGreetingCard(bool isDarkMode) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      // padding: EdgeInsets.all(16),
      // decoration: BoxDecoration(
      //   color: isDarkMode ? Color(0xFF2C2C2C) : Colors.white,
      //   borderRadius: BorderRadius.circular(12),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black12,
      //       blurRadius: 8,
      //       offset: Offset(0, 2),
      //     ),
      //   ],
      // ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.amkPrimary,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 12),
          Text(
            "Good morning, Mary Doe!",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainFeaturesGrid(bool isDarkMode) {
    final features = [
      {'icon': Icons.account_balance_wallet_outlined, 'label': 'Accounts'},
      {'icon': Icons.payment_outlined, 'label': 'Payments'},
      {'icon': Icons.sync_alt, 'label': 'Local Transfer'},
      {'icon': Icons.history, 'label': 'History'},
      {'icon': Icons.phone_android, 'label': 'Phone Top Up'},
      {'icon': Icons.public, 'label': 'Overseas Transfer'},
    ];

    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(20),
      // decoration: BoxDecoration(
      //   color: isDarkMode ? Color(0xFF2C2C2C) : Colors.white,
      //   borderRadius: BorderRadius.circular(12),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black12,
      //       blurRadius: 8,
      //       offset: Offset(0, 2),
      //     ),
      //   ],
      // ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 20,
          childAspectRatio: 1.1,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          return _buildFeatureItem(
            features[index]['icon'] as IconData,
            features[index]['label'] as String,
            isDarkMode,
          );
        },
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String label, bool isDarkMode) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDarkMode ? Color(0xFF2C2C2C) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: AppColors.amkPrimary,
            size: 28,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: isDarkMode ? Colors.white : Colors.black87,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionButtons(bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.send, size: 20),
              label: Text("Fast Transfer"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.amkPrimary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.payment, size: 20),
              label: Text("Fast Payment"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2196F3),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExploreFeaturesSection(bool isDarkMode) {
    final exploreFeatures = [
      {'icon': Icons.stars, 'label': 'My\nPoints', 'color': Color(0xFFFFB300)},
      {
        'icon': Icons.request_quote,
        'label': 'Loan\nRequest',
        'color': Color(0xFF00BCD4)
      },
      {
        'icon': Icons.account_balance,
        'label': 'Credit Bureau\nCambodia',
        'color': Color(0xFF4CAF50)
      },
      {
        'icon': Icons.savings,
        'label': 'Goal\nSavings',
        'color': Color(0xFF2196F3)
      },
    ];

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore Features",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text("See all",
                        style: TextStyle(color: AppColors.amkPrimary)),
                    Icon(Icons.chevron_right,
                        color: AppColors.amkPrimary, size: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 136,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: exploreFeatures.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                width: 100,
                decoration: BoxDecoration(
                  color: isDarkMode ? Color(0xFF2C2C2C) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                // width: 80,
                margin: EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: exploreFeatures[index]['color'] as Color,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        exploreFeatures[index]['icon'] as IconData,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      exploreFeatures[index]['label'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                        color: isDarkMode ? Colors.white : Colors.black87,
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

  Widget _buildPromotionsSection(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Promotions",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 150,
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.amkPrimary, Color(0xFFE91E63)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              "1% Promotion",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar(bool isDarkMode) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Color(0xFF2C2C2C) : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: AppColors.amkPrimary,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Cards',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.amkPrimary,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 24),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Others',
          ),
        ],
      ),
    );
  }
}

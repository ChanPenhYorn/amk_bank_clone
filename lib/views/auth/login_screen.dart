// lib/views/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/core/utils/app_colors.dart';
import 'package:getx_mvvm_architecture/r.dart';
import 'package:getx_mvvm_architecture/routes/app_route.dart';
import 'package:getx_mvvm_architecture/views/home/dashboard_screen.dart';
import 'package:getx_mvvm_architecture/views/auth/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if we are in dark mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final backgroundDecoration = BoxDecoration(
      // gradient: isDarkMode ? darkGradient : lightGradient,

      image: DecorationImage(
          image: AssetImage(AssetImages.splash), fit: BoxFit.cover),
    );

    return Scaffold(
      body: Stack(
        children: [
          // 1. Background
          Positioned.fill(
            bottom: MediaQuery.of(context).size.height / 3.5,
            child: Container(
              decoration: backgroundDecoration,
            ),
          ),

          // 1.5. Gradient Overlay (fade to white at bottom)
          Positioned.fill(
            bottom: MediaQuery.of(context).size.height / 3.5,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.white.withValues(alpha: 0.3),
                    Colors.white.withValues(alpha: 0.7),
                    Colors.white,
                  ],
                  stops: [0.0, 0.5, 0.75, 0.9, 1.0],
                ),
              ),
            ),
          ),

          // 2. Main Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header (Logo + Language)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo Placeholder
                      Image.asset(AssetImages.amkNoBg, height: 50, width: 50),

                      // Language Selector Placeholder
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Text("EN",
                                style: TextStyle(color: AppColors.amkPrimary)),
                            SizedBox(width: 8),
                            Icon(Icons.language,
                                color: AppColors.amkPrimary, size: 18),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Spacer(), // Push content down

                // Login Card / Action Area
                Container(
                  padding: EdgeInsets.all(24),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Color(0xFF2C2C2C) : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.amkPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Navigate to Dashboard
                            Get.to(() => DashboardScreen());
                          },
                          child: Text(
                            "ចូលប្រើប្រាស់",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      SizedBox(height: 12),

                      // Outline Button (Activate)
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.amkPrimary),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "បើកដំណើរការ",
                            style: TextStyle(
                                color: AppColors.amkPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // Divider
                      Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("មិនទាន់មានគណនី ឬ ភ្លេចអាយឌី?",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // Floating Create Account Button
                GestureDetector(
                  onTap: () {
                    Get.to(() => RegisterScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 4))
                        ]),
                    child: Center(
                      child: Text("បង្កើតគណនីខ្លួនឯង (សាកល្បង)",
                          style: TextStyle(
                              color: AppColors.amkPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  ),
                ),

                SizedBox(
                  height: 120,
                ),

                // Spacer(),

                // Footer
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFooterItem(
                        Icons.location_on,
                        "ទីតាំង AMK",
                        Colors.black,
                        onTap: () => Get.toNamed(AppRoutes.location),
                      ),
                      _buildFooterItem(
                        Icons.chat_bubble_outline,
                        "ឆាត",
                        Colors.black,
                      ),
                      _buildFooterItem(
                        Icons.call,
                        "ទំនាក់ទំនង",
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

  Widget _buildFooterItem(IconData icon, String label, Color color,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))
          ],
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.amkPrimary),
            ),
            SizedBox(height: 8),
            Text(label,
                style: TextStyle(
                    color: color, fontSize: 12, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

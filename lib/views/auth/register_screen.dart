// lib/views/auth/register_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/core/utils/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedCountryCode = '+855';

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.amkPrimary,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'ចូលប្រើប្រាស់',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    color: isDarkMode ? Color(0xFF1E1E1E) : Color(0xFFFCE4EC),
                    child: Column(
                      children: [
                        // Phone Icon with Label
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.amkPrimary.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Icon(
                            Icons.phone_android,
                            size: 50,
                            color: AppColors.amkPrimary,
                          ),
                        ),

                        SizedBox(height: 16),

                        Text(
                          'បញ្ចូលលេខទូរស័ព្ទ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.amkPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 40),

                        // Phone Number Input Section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Country Code Dropdown
                            Container(
                              height: 56,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? Color(0xFF2C2C2C)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _selectedCountryCode,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: '+855',
                                      child: Text(
                                        '+855',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black87,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: '+1',
                                      child: Text(
                                        '+1',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black87,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: '+66',
                                      child: Text(
                                        '+66',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedCountryCode = value!;
                                    });
                                  },
                                ),
                              ),
                            ),

                            SizedBox(width: 12),

                            // Phone Number Input
                            Expanded(
                              child: Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? Color(0xFF2C2C2C)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                                child: TextField(
                                  controller: _phoneController,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'លេខទូរស័ព្ទ',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16),

                        // Info Text
                        Text(
                          'លេខទូរស័ព្ទរបស់អ្នកត្រូវតែត្រឹមត្រូវ ដោយសារ AMK នឹង ផ្ញើ កូដកាកបាទ ចាត់ចែងលេខទូរស័ព្ទរបស់អ្នកមកអោយ។ ប្រសិនបើអ្នកមិនទទួលបានកូដនោះ សូមទំនាក់ទំនងមកកាន់ក្រុមហ៊ុន AMK ដើម្បីទទួលបានការជួយ។',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.left,
                        ),

                        SizedBox(height: 24),

                        // Password Input
                        Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color:
                                isDarkMode ? Color(0xFF2C2C2C) : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            style: TextStyle(
                              fontSize: 16,
                              color: isDarkMode ? Colors.white : Colors.black87,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.grey,
                              ),
                              hintText: 'លេខសម្ងាត់ ៦ ខ្ទង់',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              counterText: '',
                            ),
                          ),
                        ),

                        SizedBox(height: 16),

                        // Forgot Password Link
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Handle forgot password
                            },
                            child: Text(
                              'ភ្លេចលេខសម្ងាត់',
                              style: TextStyle(
                                color: AppColors.amkPrimary,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Next Button
            Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Handle next action
                    // You can add validation here
                    if (_phoneController.text.isNotEmpty &&
                        _passwordController.text.length == 6) {
                      // Navigate to next screen or process registration
                      Get.snackbar(
                        'Success',
                        'Registration in progress...',
                        backgroundColor: AppColors.amkPrimary,
                        colorText: Colors.white,
                      );
                    } else {
                      Get.snackbar(
                        'Error',
                        'Please fill in all fields correctly',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: Text(
                    'បន្ទាប់',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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

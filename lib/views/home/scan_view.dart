import 'package:flutter/material.dart';
import 'package:getx_mvvm_architecture/core/utils/extensions.dart';
import 'package:getx_mvvm_architecture/core/shared/app_font.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.qr_code_scanner,
              size: 60, color: context.colors.primary.withOpacity(0.5)),
          SizedBox(height: 16),
          Text(
            "Scan QR",
            style: AppFont.bold(
              fontSizeValue: 18,
              color: context.colors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

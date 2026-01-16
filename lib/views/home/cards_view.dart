import 'package:flutter/material.dart';
import 'package:getx_mvvm_architecture/core/utils/extensions.dart';
import 'package:getx_mvvm_architecture/core/shared/app_font.dart';

class CardsView extends StatelessWidget {
  const CardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.credit_card,
              size: 60, color: context.colors.primary.withOpacity(0.5)),
          SizedBox(height: 16),
          Text(
            "My Cards",
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

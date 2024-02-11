import 'package:crafty_bay/Presentation/ui/Screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utility/app_colors.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => const ProductListScreen(
            categories: 'Electronics',
          ),
        );
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.1),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.computer,
                color: AppColors.primaryColor,
                size: 32,
              ),
            ),
          ),
          const Text(
            'Electronics',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}

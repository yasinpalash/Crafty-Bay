import 'package:crafty_bay/Presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/Presentation/ui/Utility/app_colors.dart';
import 'package:crafty_bay/Presentation/ui/Utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Card(
                    child: Row(
                      children: [
                        Image.asset(
                          AssetsPath.dummyShoeJpg,
                          width: 100,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('New Nike shoe mk231'),
                                        Text('New Nike shoe mk231'),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.delete_outline))
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$100',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryColor),
                                  ),
                                  ItemCount(
                                    initialValue: 1,
                                    minValue: 1,
                                    maxValue: 10,
                                    decimalPlaces: 0,
                                    step: 1,
                                    color: AppColors.primaryColor,
                                    onChanged: (value) {
                                      // Handle counter value changes
                                      print('Selected value: $value');
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            totalPriceAndCheckOutSection
          ],
        ),
      ),
    );
  }

  Container get totalPriceAndCheckOutSection {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45),
              ),
              Text(
                '\$10000',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('CheckOut'),
            ),
          )
        ],
      ),
    );
  }
}

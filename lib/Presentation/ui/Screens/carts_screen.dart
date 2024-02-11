import 'package:crafty_bay/Presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  @override
  Widget build(BuildContext context) {
    return  PopScope(
      canPop: false,
      onPopInvoked: (_){
        Get.find<MainBottomNavController>().backToHome();

      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading:  IconButton(
            onPressed: (){
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
    );
  }
}

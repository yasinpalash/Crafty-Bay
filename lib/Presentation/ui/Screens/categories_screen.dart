import 'package:crafty_bay/Presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/categories_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
          ),
          title: const Text(
            'Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
          elevation: 3,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            itemCount: 100,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
              childAspectRatio: 0.95,
                mainAxisSpacing: 12,
                crossAxisSpacing: 8
              ),
              itemBuilder: (context,index){
                return  const FittedBox(child: CategoriesItem());
              }),
        ),
      ),
    );
  }
}

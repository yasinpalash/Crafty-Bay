import 'package:crafty_bay/Presentation/state_holder/category_controller.dart';
import 'package:crafty_bay/Presentation/state_holder/home_banner_controller.dart';
import 'package:crafty_bay/Presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/Presentation/ui/Screens/Home_screen.dart';
import 'package:crafty_bay/Presentation/ui/Screens/carts_screen.dart';
import 'package:crafty_bay/Presentation/ui/Screens/categories_screen.dart';
import 'package:crafty_bay/Presentation/ui/Screens/wishlistscreen.dart';
import 'package:crafty_bay/Presentation/ui/Utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screen = const [
    HomeScreen(),
    CategoriesScreen(),
    CartsScreen(),
    WishListsScreen()
  ];
  @override
  void initState() {

    super.initState();
    Get.find<HomeBannerController>().getBannerList();
    Get.find<CategoryController>().getCategory();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screen[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: controller.changeIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_sharp), label: 'Carts'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wish'),
            ],
          ),
        );
      }
    );
  }
}

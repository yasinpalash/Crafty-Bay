import 'package:crafty_bay/Presentation/ui/Screens/Home_screen.dart';
import 'package:crafty_bay/Presentation/ui/Screens/carts_screen.dart';
import 'package:crafty_bay/Presentation/ui/Screens/categories_screen.dart';
import 'package:crafty_bay/Presentation/ui/Screens/wishlistscreen.dart';
import 'package:crafty_bay/Presentation/ui/Utility/app_colors.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screen = const [
    HomeScreen(),
    CategoriesScreen(),
    CartsScreen(),
    WishListsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          _selectedIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
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
}

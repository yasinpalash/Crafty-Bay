import 'package:crafty_bay/Presentation/ui/Widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holder/main_bottom_nav_controller.dart';

class WishListsScreen extends StatefulWidget {
  const WishListsScreen({super.key});
  @override
  State<WishListsScreen> createState() => _WishListsScreenState();
}
class _WishListsScreenState extends State<WishListsScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
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
            'WishList',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          ),
          elevation: 3,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            itemCount: 100,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.90,
                mainAxisSpacing: 8,
                crossAxisSpacing: 4),
                itemBuilder: (context,index) {
              return const FittedBox(
                child: ProductCardItem(),
              );
            },
          ),
        ),
      ),
    );
  }
}

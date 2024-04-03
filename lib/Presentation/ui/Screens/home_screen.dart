import 'package:crafty_bay/Presentation/state_holder/auth_controller.dart';
import 'package:crafty_bay/Presentation/state_holder/home_banner_controller.dart';
import 'package:crafty_bay/Presentation/state_holder/main_bottom_nav_controller.dart';
import 'package:crafty_bay/Presentation/ui/Screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/Presentation/ui/Screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utility/assets_path.dart';
import '../Widgets/categories_item.dart';
import '../Widgets/home/circleiconbutton.dart';
import '../Widgets/home/banner_carousel.dart';
import '../Widgets/home/section_title.dart';
import '../Widgets/product_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              searchTextField,
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  height: 210,
                  child: GetBuilder<HomeBannerController>(
                      builder: (homeBannerController) {
                    return BannerCarousel(bannerList:
                      homeBannerController.bannerListModel.bannerList??
                    [],

                    );
                  })),
              const SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: 'All Categories',
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              SectionTitle(
                title: 'Popular',
                onTapSeeAll: () {
                  Get.to(() => const ProductListScreen());
                },
              ),
              productList,
              const SizedBox(
                height: 8,
              ),
              SectionTitle(
                title: 'Special',
                onTapSeeAll: () {},
              ),
              productList,
              const SizedBox(
                height: 8,
              ),
              SectionTitle(
                title: 'New',
                onTapSeeAll: () {},
              ),
              productList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 130,
      child: ListView.separated(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const CategoriesItem();
          },
          separatorBuilder: (_, __) {
            return const SizedBox(
              width: 8,
            );
          },
          itemCount: 10),
    );
  }

  SizedBox get productList {
    return SizedBox(
      height: 190,
      child: ListView.separated(
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const ProductCardItem();
          },
          separatorBuilder: (_, __) {
            return const SizedBox(
              width: 8,
            );
          },
          itemCount: 10),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        filled: true,
        fillColor: Colors.grey.shade200,
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.appBarLogo),
      actions: [
        CircleIconButton(
          onTap: () async {
            await Get.find<AuthController>().authClearData();
            Get.to(const VerifyEmailScreen());
          },
          iconData: Icons.person,
        ),
        const SizedBox(
          width: 10,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        const SizedBox(
          width: 10,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.notifications_active,
        ),
      ],
    );
  }
}

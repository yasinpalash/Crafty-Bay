import 'package:flutter/material.dart';
import '../Utility/assets_path.dart';
import '../Widgets/home/circleiconbutton.dart';
import '../Widgets/home/banner_carousel.dart';
import '../Widgets/home/section_title.dart';

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
              const BannerCarousel(),
              const SizedBox(
                height: 16,
              ),
               SectionTitle(
                title: 'All Categories',
                onTapSeeAll: (){},
              )
            ],
          ),
        ),
      ),
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
          onTap: () {},
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



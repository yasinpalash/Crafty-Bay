import 'package:crafty_bay/Presentation/ui/Screens/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Presentation/ui/Utility/app_theme_data.dart';
import 'controller_binder.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialBinding: ControllerBinder(),
      theme: AppThemeData.lightThemeData,
    );
  }
}


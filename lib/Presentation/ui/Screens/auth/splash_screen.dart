import 'package:crafty_bay/Presentation/state_holder/auth_controller.dart';
import 'package:crafty_bay/Presentation/ui/Screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/Presentation/ui/Screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/Presentation/ui/Widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    final bool isLoggedId = await Get.find<AuthController>().isLoggedIn();
    if (isLoggedId==false) {
      Get.to(const MainBottomNavScreen());
    } else {
      Get.offAll(const VerifyEmailScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(
              height: 16,
            ),
            Text('version 1.0'),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}

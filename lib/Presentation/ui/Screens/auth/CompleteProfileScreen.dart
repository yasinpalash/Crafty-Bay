import 'package:crafty_bay/Presentation/ui/Widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main_bottom_nav_screen.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const AppLogo(
                height: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Complete Profile",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 28)),
              Text(
                'Get started with us with your details',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(textInputAction: TextInputAction.next,

                keyboardType:TextInputType.phone ,
                decoration: InputDecoration(

                  hintText: 'Mobile',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'City',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                textInputAction: TextInputAction.done,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Shipping Address',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(const MainBottomNavScreen());
                  },
                  child: const Text('Complete'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

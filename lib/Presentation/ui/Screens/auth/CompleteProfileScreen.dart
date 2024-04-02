import 'package:crafty_bay/Presentation/state_holder/complete_profile_controller.dart';
import 'package:crafty_bay/Presentation/state_holder/verify_otp_controller.dart';
import 'package:crafty_bay/Presentation/ui/Widgets/app_logo.dart';
import 'package:crafty_bay/data/models/creat_profile_params.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main_bottom_nav_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            child: Column(
              key: _formKey,
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
                TextFormField(
                  controller: _firstNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Your First Name';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _lastNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your last name';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _mobileTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Mobile',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Number';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _mobileTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'City',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your City';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _shippingAddressTEController,
                  textInputAction: TextInputAction.done,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Shipping Address',
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Shipping Address';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CompleteProfileController>(
                    builder: (completeProfileController) {
                      return ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final bool result =
                                await Get.find<CompleteProfileController>()
                                    .createProfileDate(
                                        Get.find<VerifyOtpController>().token,
                                        CreateProfileParams(
                                          firstName: _firstNameTEController.text
                                              .trim(),
                                          lastName:
                                              _lastNameTEController.text.trim(),
                                          mobile:
                                              _mobileTEController.text.trim(),
                                          city: _cityTEController.text.trim(),
                                          shippingAddress:
                                              _shippingAddressTEController.text
                                                  .trim(),
                                        ));

                            if (result) {
                              Get.offAll(const MainBottomNavScreen());
                            } else {
                              Get.showSnackbar(
                                GetSnackBar(
                                  title: 'Completed Profile failed',
                                  message:
                                      completeProfileController.errorMessage,
                                  duration: const Duration(seconds: 2),
                                  isDismissible: true,
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Complete'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shippingAddressTEController.dispose();
    super.dispose();
  }
}

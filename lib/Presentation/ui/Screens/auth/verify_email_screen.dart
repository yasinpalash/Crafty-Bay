import 'package:crafty_bay/Presentation/state_holder/send_email_otp_controller.dart';
import 'package:crafty_bay/Presentation/ui/Screens/auth/verify_otp_screen.dart';
import 'package:crafty_bay/Presentation/ui/Widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                const SizedBox(height: 180),
                const AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Please Enter Your Email Address',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                  ),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                GetBuilder<SendEmailOtpController>(
                  builder: (controller) {
                    return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: controller.inProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            // if (_fromKey.currentState!.validate()) {
                            //   final bool result =
                            //       await controller.sendOtpToEmail(
                            //           _emailTEController.text.trim());
                            //   if (result) {
                            Get.to(
                              () => VerifyOtpScreen(
                                email: _emailTEController.text.trim(),
                              ),
                            );
                            //   } else {
                            //     Get.showSnackbar(
                            //       GetSnackBar(
                            //         title: 'send otp failed',
                            //         message: controller.errorMessage,
                            //       ),
                            //     );
                            //   }
                            // }
                          },
                          child: const Text('Next'),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

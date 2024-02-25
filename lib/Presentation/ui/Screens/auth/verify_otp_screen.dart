import 'dart:async';
import 'package:crafty_bay/Presentation/ui/Utility/app_colors.dart';
import 'package:crafty_bay/Presentation/ui/Widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../state_holder/verify_otp_controller.dart';
import 'CompleteProfileScreen.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late Timer _timer;
  int _expirationTime = 120;
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSecond,
      (Timer timer) {
        if (_expirationTime == 0) {
          // Timer has expired, you can handle this case accordingly
          timer.cancel();
        } else {
          setState(
            () {
              _expirationTime--;
            },
          );
        }
      },
    );
  }

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
                  "Enter OTP Code",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'A 4 Digit OTP Code has been Sent',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: AppColors.primaryColor,
                      selectedFillColor: Colors.transparent,
                      selectedColor: Colors.purple),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(

                  width: double.infinity,
                  child: GetBuilder<VerifyOtpController>(
                    builder: (verifyOTPController) {
                      return Visibility(
                        visible: verifyOTPController.inProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_fromKey.currentState!.validate()) {
                              final bool response =
                                  await verifyOTPController.verifyOTP(
                                widget.email,
                                _otpTEController.text.trim(),
                              );

                              if (response) {
                                Get.to(const CompleteProfileScreen());
                              } else {
                                Get.showSnackbar(GetSnackBar(
                                  title: 'OTP Verification failed',
                                  message: verifyOTPController.errorMessage,
                                ));
                              }
                            }
                          },
                          child: const Text('Next'),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      const TextSpan(text: 'This Code is Expire in '),
                      TextSpan(
                        text: '$_expirationTime s',
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(color: Colors.grey),
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
    _timer.cancel();
    _timer.cancel();
    super.dispose();
  }
}

import 'package:crafty_bay/Presentation/ui/Utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: AppColors.primaryColor),
  );
  runApp(const CraftyBay());
}

import 'dart:developer';

import 'package:crafty_bay/Presentation/state_holder/auth_controller.dart';
import 'package:crafty_bay/Presentation/state_holder/read_profile_data.dart';
import 'package:crafty_bay/data/Utility/urls.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  bool _shouldNavigateCompleteProfile = false;
  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  Future<bool> verifyOTP(String email, String otp) async {
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.verityOTP(email, otp));
    _inProgress = false;
    if (response.isSuccess) {
      final token = response.responseData['data'];
      log(token);
      await Future.delayed(const Duration(seconds: 3));
      final result =
          await Get.find<ReadProfileDataController>().readProfileData(token);
      if(result==false){
        _shouldNavigateCompleteProfile=Get.find<ReadProfileDataController>().isProfileComplete==false;
        if(_shouldNavigateCompleteProfile==true){
          await Get.find<AuthController>().saveUserDetails(token, Get.find<ReadProfileDataController>().profile);
        }

      }else{
        _errorMessage=Get.find<ReadProfileDataController>().errorMessage;
        update();
        return false;
      }
      // Todo: SAVE TO LOCAL CACHE
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}

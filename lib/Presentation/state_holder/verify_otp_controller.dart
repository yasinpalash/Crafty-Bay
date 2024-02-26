import 'package:crafty_bay/Presentation/state_holder/read_profile_data.dart';
import 'package:crafty_bay/data/Utility/urls.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;
  bool _shouldNavigateCompleteProfile = true;
  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  Future<bool> verifyOTP(String email, String otp) async {
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.verityOTP(email, otp));
    _inProgress = false;
    if (response.isSuccess) {
      final token = response.responseData['data'];
      final result =
          await Get.find<ReadProfileDataController>().readProfileData(token);
      if(result){
        _shouldNavigateCompleteProfile=Get.find<ReadProfileDataController>().isProfileComplete==false;
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

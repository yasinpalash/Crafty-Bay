import 'package:crafty_bay/Presentation/state_holder/auth_controller.dart';
import 'package:crafty_bay/data/Utility/urls.dart';
import 'package:crafty_bay/data/models/creat_profile_params.dart';
import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  Profile _profile = Profile();
  Profile get profile => _profile;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<bool> createProfileDate(String token,CreateProfileParams params) async {
    _inProgress = true;
    update();

    final response = await NetworkCaller()
        .postRequest(Urls.createProfile, token: token, body: params.toJson());
    _inProgress = false;
    if (response.isSuccess) {
      _profile = Profile.fromJson(response.responseData['data']);
      Get.find<AuthController>().saveUserDetails(token, _profile);

      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}

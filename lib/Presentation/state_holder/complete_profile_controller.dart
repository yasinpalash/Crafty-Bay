import 'package:crafty_bay/data/Utility/urls.dart';
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

  Future<bool> createProfileDate(
    String token,
    String firstName,
    String lastName,
    String mobile,
    String city,
    String shippingAddress,
  ) async {
    _inProgress = true;
    update();
    Map<String, dynamic> inputParams = {
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "city": city,
      "shippingAddress": shippingAddress,
    };
    final response = await NetworkCaller()
        .postRequest(Urls.createProfile, token: token, body: inputParams);
    _inProgress = false;
    if (response.isSuccess) {
      _profile = Profile.fromJson(response.responseData['data']);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}

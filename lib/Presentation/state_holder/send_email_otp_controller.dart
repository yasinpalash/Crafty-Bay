import 'package:crafty_bay/data/Utility/urls.dart';
import 'package:crafty_bay/data/models/response_data.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

class SendEmailOtpController extends GetxController {
  bool _inProgress = true;

  bool get inProgress => _inProgress;

  Future<bool> sendOtpToEmail(String email) async {
    _inProgress = false;
    update();
    final ResponseData response =
        await NetworkCaller().getRequest(Urls.sendEmailOtp(email));
  }
}

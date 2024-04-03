import 'dart:developer';

import 'package:crafty_bay/data/models/banner_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';
import '../../data/Utility/urls.dart';

class HomeBannerController extends GetxController {


  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  BannerListModel _bannerListModel = BannerListModel();
  BannerListModel get bannerListModel => _bannerListModel;

  Future<bool> getBannerList() async {
    bool isSuccess = false;
    update();
    final response = await NetworkCaller().getRequest(Urls.homeBanner);
    log(response.responseData);
    if (response.isSuccess) {
      _bannerListModel = BannerListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}

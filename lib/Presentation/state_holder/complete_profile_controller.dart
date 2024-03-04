import 'package:crafty_bay/data/Utility/urls.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController{

  bool _inProgress=false;

  bool get inProgress=> _inProgress;

  Future<bool> createProfile(String token) async{

    _inProgress=true;
    update();
    final response= await NetworkCaller().postRequest(Urls)




  }

}
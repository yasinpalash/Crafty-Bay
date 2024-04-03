import 'package:crafty_bay/data/models/category_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/Utility/urls.dart';

class CategoryController extends GetxController {
  
  bool _inProgress=false;
  bool get inProgress=> _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  CategoryListModel _categoryListModel=CategoryListModel();
  CategoryListModel get categoryListModel=>_categoryListModel;
  Future<bool> getCategory ()async{
    _inProgress=true;
    update();
    final response= await NetworkCaller().getRequest(Urls.category);
    _inProgress=false;
    if(response.isSuccess){
      _categoryListModel=CategoryListModel.fromJson(response.responseData);
      update();
      return true;
    }else{
      _errorMessage=response.errorMessage;
    }
    update();
    return false;

  }
}
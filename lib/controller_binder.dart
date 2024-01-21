import 'package:get/get.dart';
import 'Presentation/state_holder/main_bottom_nav_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }

}

import 'package:get/get.dart';
import 'package:testproject/controller/get_products_controller.dart';
import 'package:testproject/controller/login_control.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut(() => Login_controller());
    Get.lazyPut(() => Products_controller());
  }
}

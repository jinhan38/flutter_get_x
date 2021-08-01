import 'package:flutter_get_x/page/controller/dependency_controller.dart';
import 'package:get/get.dart';

class BindingPageBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(DependencyController());
  }

}
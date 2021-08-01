import 'package:get/get.dart';

class DependencyController extends GetxController {

  static DependencyController get to => Get.find();
  void increase() {
    print('DependencyController increase 호출');
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountControllerWithGetX extends GetxController {

  //GetxController는 singleton이기 때문에 이렇게 리턴에서 사용할 수 있다.
  static CountControllerWithGetX get to => Get.find();

  int count = 0;

  void increase() {
    count++;
    update();
  }
}

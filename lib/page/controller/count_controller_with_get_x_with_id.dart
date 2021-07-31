import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountControllerWithGetXWithID extends GetxController {
  int count = 0;

  void increase(String id) {
    count++;
    update([id]); //아이디 부여
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_get_x/main.dart';
import 'package:get/get.dart';

class SecondNamedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('SecondNamedPage')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('뒤로이동')),
              ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed('/');
                  },
                  child: Text('홈으로 이동')),
            ],
          ),
        ),
      ),
    );
  }
}

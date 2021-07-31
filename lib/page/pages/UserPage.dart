import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('UserPage')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('argument name : ${Get.arguments['name']}'),
              // Text('argument job : ${Get.arguments['job']}'),
              Text('argument name : ${Get.parameters['name']}'),
              Text('argument age : ${Get.parameters['age']}'),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('뒤로이동')),
            ],
          ),
        ),
      ),
    );
  }
}

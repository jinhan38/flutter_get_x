import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/pages/normal/second.dart';
import 'package:get/get.dart';
class FirstNamedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('FirstNamedPage')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.offNamed('/second');
                  },
                  child: Text('SecondNamedPage 이동')),
            ],
          ),
        ),
      ),
    );
  }
}

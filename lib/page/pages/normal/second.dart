import 'package:flutter/material.dart';
import 'package:flutter_get_x/main.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SecondPage')),
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
                  Get.offAll(MyHomePage());
                },
                child: Text('홈으로 이동')),
          ],
        ),
      ),
    );
  }
}

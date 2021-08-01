import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/pages/normal/second.dart';
import 'package:get/get.dart';
class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FirstPage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(() => SecondPage());
                },
                child: Text('SecondPage 이동')),
          ],
        ),
      ),
    );
  }
}

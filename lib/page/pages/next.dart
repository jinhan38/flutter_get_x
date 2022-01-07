import 'package:flutter/material.dart';
import 'package:flutter_get_x/main.dart';
import 'package:get/get.dart';

class NextPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NextPage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('argument name full : ${(Get.arguments as User)}'),
            Text('argument name : ${(Get.arguments as User).name}'),
            Text('argument job : ${(Get.arguments as User).job}'),
            Text('argument age : ${(Get.arguments as User).age}'),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('뒤로이동')),

            Text('create newbranch')
          ],
        ),
      ),
    );
  }
}

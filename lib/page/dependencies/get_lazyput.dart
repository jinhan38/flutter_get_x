import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/controller/dependency_controller.dart';
import 'package:get/get.dart';

class GetLazyPut extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetLazyPut'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.find<DependencyController>().increase();
            }, child: Text("컨트롤러 접근"))
          ],
        ),
      ),
    );
  }
}

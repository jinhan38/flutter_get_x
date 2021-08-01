import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/controller/dependency_controller.dart';
import 'package:get/get.dart';

class GetPut extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetPut'),),
      body: ElevatedButton(child: Text("increase"),onPressed: (){
        Get.find<DependencyController>().increase();
      }),
    );
  }
}

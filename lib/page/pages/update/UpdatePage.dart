import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/controller/BuilderController.dart';
import 'package:get/get.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UpdatePage")),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Update'),
              GetBuilder<BuilderController>(
                  init: BuilderController(),
                  builder: (_) {
                    return Text("count : ${_.count}");
                  }),
              ElevatedButton(onPressed: (){
                Get.find<BuilderController>().increase();
              }, child: Text("카운트 증가")),
            ],
          ),
        ),
      ),
    );
  }
}

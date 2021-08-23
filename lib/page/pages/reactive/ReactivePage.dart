import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/controller/BuilderController.dart';
import 'package:get/get.dart';

class ReactivePage extends StatefulWidget {
  const ReactivePage({Key? key}) : super(key: key);

  @override
  _ReactivePageState createState() => _ReactivePageState();
}

class _ReactivePageState extends State<ReactivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UpdatePage")),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("reactive"),
              GetX<ReactiveController>(
                  init: ReactiveController(),
                  builder: (_) {
                    return Text("count 2 : ${_.count2.value}");
                  }),
              Obx(() {
                return Text("Count3 : " +
                    Get.find<ReactiveController>().count3.toString());
              }),
              Obx(() {
                return Text("count sum : " +
                    Get.find<ReactiveController>().sum.toString());
              }),
              Obx(() {
                return Text("user info : " +
                    Get.find<ReactiveController>().user.value.id.toString() +
                    ", " +
                    Get.find<ReactiveController>().user.value.name.toString());
              }),
              ElevatedButton(
                  onPressed: () {
                    Get.find<ReactiveController>().count2++;
                  },
                  child: Text("count2 up")),
              ElevatedButton(
                  onPressed: () {
                    Get.find<ReactiveController>().count3++;
                  },
                  child: Text("count3 up")),
              ElevatedButton(
                  onPressed: () {
                    Get.find<ReactiveController>()
                        .userUpdate(i: 3, n: "jinhan 333");
                  },
                  child: Text("change user")),
            ],
          ),
        ),
      ),
    );
  }
}

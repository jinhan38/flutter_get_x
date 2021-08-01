import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/controller/count_controller_with_get_x.dart';
import 'package:flutter_get_x/page/controller/count_controller_with_get_x_reactive.dart';
import 'package:flutter_get_x/page/controller/count_controller_with_provider.dart';
import 'package:flutter_get_x/page/pages/state/WithGetX.dart';
import 'package:flutter_get_x/page/pages/state/WithProvider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ReactiveStateManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithGetXReactive());

    return Scaffold(
      appBar: AppBar(title: Text('반응형상태관리')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Getx reactive", style: TextStyle(fontSize: 30)),
            SizedBox(height: 10),
            //count의 value값이 변경될때만 Obx가 호출된다.
            //만약에 count가 1일 때 버튼을 클릭해서 5로 변경시키면 Obx가 호출된다.
            //그러나 5인 상태에서 5로 변경하는 버튼을 클릭하면 호출되지 않는다.
            //count의 값은 똑같이 5이기 때문이다.
            //count의 타입은 Rx가 필요하며 기본 변수에도 dot.obs 를 붙여줘야 한다
            Obx(() => Text(
                "count : ${Get.find<CountControllerWithGetXReactive>().count.value}",
                style: TextStyle(fontSize: 20))),
            // GetX(
            //   builder: (_) {
            //     return Text(
            //         "count : ${Get.find<CountControllerWithGetXReactive>().count.value}",
            //         style: TextStyle(fontSize: 20));
            //   },
            // ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('+', style: TextStyle(fontSize: 30)),
              onPressed: () {
                Get.find<CountControllerWithGetXReactive>().increase();
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('5로 변경', style: TextStyle(fontSize: 20)),
              onPressed: () {
                Get.find<CountControllerWithGetXReactive>().putNumber(5);
              },
            ),
          ],
        ),
      ),
    );
  }
}

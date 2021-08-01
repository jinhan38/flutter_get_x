import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/controller/count_controller_with_get_x.dart';
import 'package:flutter_get_x/page/controller/dependency_controller.dart';
import 'package:get/get.dart';

// class BindingPage extends StatelessWidget {
class BindingPage extends GetView<DependencyController> {

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerWithGetX());
    return Scaffold(
      appBar: AppBar(
        title: Text('binding'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CountControllerWithGetX>(builder: (controller) {
              return Text(controller.count.toString(), style: TextStyle(fontSize: 30),);
            }),
            ElevatedButton(
                onPressed: () {
                  CountControllerWithGetX.to.increase();
                  // Get.find<CountControllerWithGetX>().increase();
                },
                child: Text('버튼')),
            ElevatedButton(
                onPressed: () {
                  //extends를 GetView<{Controllter}>로 하면
                  //controller라는 변수를 통해 바로 접근할 수 있다
                  //GetView에는 하나의 컨트롤러밖에 넣지 못한다
                  //때문에 공통의 컨트롤러를 넣으면 좋겠다
                  controller.increase();
                  // Get.find<DependencyController>().increase();
                  // DependencyController.to.increase();
                },
                child: Text('DependencyController')),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/controller/count_controller_with_get_x.dart';
import 'package:flutter_get_x/page/controller/count_controller_with_get_x_with_id.dart';
import 'package:get/get.dart';

class WithGetX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //GetX의 컨트롤러 선언, 이렇게만 선언하면 어디에서든지 사용 가능
    //다른 class에서 선언해도 사용 가능하다.
    Get.put(CountControllerWithGetX());

    //변수에 담아서 사용할 수도 있다.
    var controller = Get.put(CountControllerWithGetX());
    var controllerWithID = Get.put(CountControllerWithGetXWithID());
    var id ='first';

    return Center(
      child: Column(
        children: [
          Spacer(),
          Text(
            "GetX",
            style: TextStyle(fontSize: 20),
          ),
          GetBuilder<CountControllerWithGetX>(builder: (controller) {
            return Text("${controller.count}", style: TextStyle(fontSize: 50));
          }),
          ElevatedButton(
              onPressed: () {
                //simple_state_manage_page class에서 Get.put(CountControllerWithGetX())로 등록한
                // CountControllerWithGetX controller를 찾아온다.
                // Get.find<CountControllerWithGetX>().increase();
                controller.increase();
              },
              child: Text("+")),
          GetBuilder<CountControllerWithGetXWithID>(
              id: id,
              builder: (controller) {
                return Text("${controllerWithID.count}",
                    style: TextStyle(fontSize: 50));
              }),
          ElevatedButton(
              onPressed: () {
                //컨트롤러의 update에 id를 부여하면 ex)update([{id}])
                //GetBuilder에 입력한 아이디가 같은 경우에만 controller가 정상적으로 작동한다.
                //이는 provider에는 없고 GetX에만 있는 기능이다.
                controllerWithID.increase(id);
              },
              child: Text("+")),
          Spacer(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/controller/dependency_controller.dart';
import 'package:flutter_get_x/page/dependencies/get_lazyput.dart';
import 'package:flutter_get_x/page/dependencies/get_put.dart';
import 'package:get/get.dart';

class DependencyManagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("의존성 주입"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Text("GetPut"),
                onPressed: () {
                  Get.to(() => GetPut(), binding: BindingsBuilder(() {
                    Get.put(DependencyController());
                  }));
                  //binding을 이용해서 필요한 의존성을 주입해준다.
                  //페이지를 이동할 때 binding으로 controller의 의존성을 주입해주는 것이다.
                  //의존성의 핵심은 특정 클래스에 있는 변수 혹은 클래스의 부품들을 외부에서 설정해주는 것이다.
                }),
            ElevatedButton(
              child: Text("Get.lazyPut"),
              onPressed: () {
                //Get.lazyPut 으로 컨트롤러를 주입하면 페이지를 이동할 때 바로 메모리에 올라가지 않는다.
                //해당 컨트롤러를 사용할 때 메모리에 올라간다.
                //정리하자면 GetLazyPut페이지에서 lazyPut로 주입한 DependencyController를
                //Get.find<DependencyController>().increase() 로 호출했을 때 initialized(메모리올라감)된다.
                //그리고 GetLazyPut페이지가 사라지면 DependencyController onDelete()가 호출되고
                //"DependencyController" deleted from memory
                Get.to(
                  () => GetLazyPut(),
                  binding: BindingsBuilder(
                    () {
                      Get.lazyPut<DependencyController>(
                          () => DependencyController());
                    },
                  ),
                );
              },
            ),
            ElevatedButton(
                child: Text("Get.putAsync"),
                onPressed: () {
                  //Get.putAsync는 비동기처리를 해준다.
                  //Get.put과 마찬가지고 initialized는 페이지 이동 시 바로 된다.
                  //하지만 await을 이용한다면 3초 후에 initialized가 된다.
                  //정리하자면 페이지 진입 후 비동기처리를 동기처럼 처리하고, 그다음에 DependencyController를 주입해서 초기화 할 수 있는 것이다.
                  //하지만 그렇게 많이 쓰일 것 같지는 않다.
                  Get.to(() => GetPut(), binding: BindingsBuilder(() {
                    Get.putAsync(() async {
                      await Future.delayed(Duration(seconds: 3));
                      return DependencyController();
                    });
                  }));
                }),
            ElevatedButton(child: Text("Get.create"), onPressed: () {
              //Get.create을 제외하고는 모두 singleton 방식이다
              //Get.create도 Get.lazyPut처럼 바로 initialized되지는 않는다
              //사용할 때 initialized화 된다
              //하지만 Get.create는 여러개를 인스턴스로 만들 수 있다
              //이경우에는 controller delete가 자동으로 되지 않는다. 직접 해줘야한다
              //그러나 특별한 경우를 제외하고는 안쓰는게 좋을 것 같다.
              Get.to(() => GetPut(), binding: BindingsBuilder((){
                Get.create(() => DependencyController());
              }));
            }),
          ],
        ),
      ),
    );
  }
}

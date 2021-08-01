import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum NUM { FIRST, SECOND }

class User {
  String name = "";
  int age = 0;

  User({required this.name, required this.age});
}

//getX는 컨트롤러의 생성과 삭제를 알아서 해준다.
//instance했다는 것은 메모리에 올라가는 것인데 getX는 컨트롤러의 instance를 알아서 삭제해서 메모리를 관리해준다.
class CountControllerWithGetXReactive extends GetxController {
  //obs는 observable의 약자
  //obs가 변화를 감지해준다.
  RxInt count = 0.obs;
  RxDouble doubleValue = 0.0.obs;
  RxString stringValue = "".obs;
  Rx<NUM> num = NUM.FIRST.obs;
  Rx<User> user = User(name: "", age: 0).obs;
  RxList<String> list = <String>[].obs;
  RxList<dynamic> list22 = [].obs;

  void increase() {
    count++;
    doubleValue.value++;
    stringValue("a");
    stringValue.value = "b";
    num(NUM.SECOND);
    num.value = NUM.SECOND;
    user(User(name: "jinhan", age: 31));
    list.addAll(["a", "b"]);
    list.addIf(user.value.name == "jinhan", "okay");
    print("user : $user, list : $list");
  }

  void putNumber(int value) {
    count(value);
  }

  //onInit같은 생명주기는 GetxController를 상속받아야 사용할 수 있다.
  //하지만 기본적은 GetX의 reactive 기능은 GetxController를 상속받지 않아도 사용 가능하다.
  @override
  void onInit() {
    ever(count, (_) => print("reactive일 때 count value가 바뀔 때만 매번 호출"));
    once(count, (_) => print("한번만 호출"));
    debounce(count, (_) => print('마지막 변경에 한번만 호출'), time: Duration(seconds: 1));
    interval(count, (_) => print('변경되고 있는 동안 duration 값의 간격마다 호출'),
        time: Duration(seconds: 1));
    //debounce는 검색기능 같은데 쓸 수 있다. 최종 입력을 멈췄을 때 api 호출
    super.onInit();
  }
}

// class CountControllerWithGetXReactive {
//
//   //obs는 observable의 약자
//   //obs가 변화를 감지해준다.
//   RxInt count = 0.obs;
//
//   void increase() {
//     count++;
//   }
//
//   void putNumber(int value){
//     count(value);
//   }
//
// }

import 'package:get/get.dart';

class BuilderController extends GetxController {
  int count = 0;

  void increase() {
    count++;
    update();
  }
}

class ReactiveController extends GetxController {
  RxInt count2 = 0.obs;
  var count3 = 0.obs;

  get sum => count2.value + count3.value;

  List<int> testList = [
    1,
    2,
    3,
    4,
    5,
    6,
  ];

  var user = User(id: 1, name: "jinhan").obs;

  userUpdate({required int i, required String n}) {
    user.update((val) {
      val!.name = n;
      val.id = i;
    });
  }

  @override
  void onInit() {
    super.onInit();
    once(count2, (_) => print("once 처음으로 count2 변경됨"));
    ever(count2, (_) => print("ever count2 변경될 때 마다 실행"));
    interval(count2, (_) => print("interval count2 업데이트 1초 후 실행, 실행된 후 또 클릭한다면 1초 후 실행, 주기적으로 실행"),
        time: Duration(seconds: 1));
    debounce(count2, (_) => print("debounce count2 업데이트 1초 후 실행, 1초가 지나기 전에 또 업데이트되면 실행 안됨"),
        time: Duration(seconds: 1));
  }
}

class User {
  int id;

  String name;

  User({required this.id, required this.name});
}

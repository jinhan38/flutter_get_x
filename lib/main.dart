import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/binding/BindingPageBinding.dart';
import 'package:flutter_get_x/page/controller/dependency_controller.dart';
import 'package:flutter_get_x/page/dependencies/dependency_manage_page.dart';
import 'package:flutter_get_x/page/pages/BindingPage.dart';
import 'package:flutter_get_x/page/pages/ReactiveStateManagePage.dart';
import 'package:flutter_get_x/page/pages/named/first.dart';
import 'package:flutter_get_x/page/pages/named/second.dart';
import 'package:flutter_get_x/page/pages/normal/first.dart';
import 'package:flutter_get_x/page/pages/reactive/ReactivePage.dart';
import 'package:flutter_get_x/page/pages/simple_state_manage_page.dart';
import 'package:flutter_get_x/page/pages/update/UpdatePage.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'page/pages/UserPage.dart';
import 'page/pages/next.dart';

void main() {
  initService();
  runApp(MyApp());
}

//permanent : true로 하면 앱이 종료되기 전까지는 상태를 계속 유지한다
void initService(){
  Get.put(DependencyController(), permanent: true);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => MyHomePage(),
          transition: Transition.leftToRight,
        ),
        GetPage(
          name: "/first",
          page: () => FirstNamedPage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: "/second",
          page: () => SecondNamedPage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: "/next",
          page: () => NextPage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: "/user",
          page: () => UserPage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: "/binding",
          page: () => BindingPage(),
          transition: Transition.rightToLeft,
          //Bindings를 상속받은 binding클래스를 주입할 수 있다.
          binding: BindingPageBinding(),
          // binding: BindingsBuilder(
          //   () {
          //     //라우트에서 컨트롤러를 주입할 수도 있다.
          //     // Get.put(DependencyController());
          //   },
          // ),
        ),
        GetPage(
          name: "/update",
          page: () => UpdatePage(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: "//reactive",
          page: () => ReactivePage(),
          transition: Transition.rightToLeft,
        ),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX 라우트 예제")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Text('firstPage 이동(일반)'),
                onPressed: () {
                  Get.to(() => FirstPage());
                }),
            ElevatedButton(
                child: Text('firstPage 이동(Named)'),
                onPressed: () {
                  Get.toNamed("/first");
                }),
            ElevatedButton(
                child: Text('toNamed argument 전달'),
                onPressed: () {
                  // Get.toNamed("/next", arguments: {"name" : "jinhan", "job" : "developer"});
                  Get.toNamed("/next", arguments: User());
                }),
            ElevatedButton(
                child: Text('동적 url 전달'),
                onPressed: () {
                  Get.toNamed("/user?name=jinhan&age=31");
                }),
            ElevatedButton(
                child: Text('단순상태관리'),
                onPressed: () {
                  Get.to(() => simple_state_manage_page());
                }),
            ElevatedButton(
                child: Text('반응형상태관리'),
                onPressed: () {
                  Get.to(() => ReactiveStateManagePage());
                }),
            ElevatedButton(
                child: Text('의존성 관리'),
                onPressed: () {
                  Get.to(() => DependencyManagePage());
                }),
            ElevatedButton(
                child: Text('바인딩'),
                onPressed: () {
                  Get.toNamed("/binding");
                }),
            ElevatedButton(
                child: Text('업데이트'),
                onPressed: () {
                  Get.toNamed("/update");
                }),
            ElevatedButton(
                child: Text('Reactive'),
                onPressed: () {
                  Get.toNamed("/reactive");
                }),
          ],
        ),
      ),
    );
  }
}

class User {
  String name = 'jinhan';
  String job = 'developer';
  String age = '31';
}

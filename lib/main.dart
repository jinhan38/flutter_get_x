import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/pages/named/first.dart';
import 'package:flutter_get_x/page/pages/named/second.dart';
import 'package:flutter_get_x/page/pages/normal/first.dart';
import 'package:flutter_get_x/page/pages/simple_state_manage_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'page/pages/UserPage.dart';
import 'page/pages/next.dart';

void main() {
  runApp(MyApp());
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
            transition: Transition.leftToRight),
        GetPage(
            name: "/first",
            page: () => FirstNamedPage(),
            transition: Transition.rightToLeft),
        GetPage(
            name: "/second",
            page: () => SecondNamedPage(),
            transition: Transition.rightToLeft),
        GetPage(
            name: "/next",
            page: () => NextPage(),
            transition: Transition.rightToLeft),
        GetPage(
            name: "/user",
            page: () => UserPage(),
            transition: Transition.rightToLeft),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    Get.to(simple_state_manage_page());
                  }),
            ],
          ),
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

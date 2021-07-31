import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/controller/count_controller_with_get_x.dart';
import 'package:flutter_get_x/page/controller/count_controller_with_provider.dart';
import 'package:flutter_get_x/page/pages/state/WithGetX.dart';
import 'package:flutter_get_x/page/pages/state/WithProvider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class simple_state_manage_page extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //
    // Get.put(CountControllerWithGetX());//GetX의 컨트롤러 선언, 이렇게만 선언하면 어디에서든지 사용 가능
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('단순상태관리')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: WithGetX(),
              ),
              Expanded(
                child: ChangeNotifierProvider<CountControllerWithProvider>(
                  create: (context) => CountControllerWithProvider(),
                  child: WithProvider(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

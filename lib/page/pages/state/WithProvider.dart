import 'package:flutter/material.dart';
import 'package:flutter_get_x/page/controller/count_controller_with_provider.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Provider",
            style: TextStyle(fontSize: 20),
          ),
      // Text(
      //     "${Provider.of<CountControllerWithProvider>(context).count}",
      //     style: TextStyle(fontSize: 50)),
          Consumer<CountControllerWithProvider>(
            builder: (context, snapshot, child) {
              return Text(
                "${snapshot.count}",
                style: TextStyle(fontSize: 50),
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                //listen : true 전체를 빌드 , listen : false로 하고 consumer를 등록하면 이 부분만 build된다.
                Provider.of<CountControllerWithProvider>(context, listen: false)
                    .increase();
              },
              child: Text("+")),
        ],
      ),
    );
  }
}

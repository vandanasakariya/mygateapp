import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/mygate_controller.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);
  final MyGateController myGateController = Get.put(MyGateController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: myGateController.cityModal.value.data?.length??0,
                itemBuilder: (context, index) {
                  final data=myGateController.cityModal.value.data?[index].length??0;
                  return Column(children: [Text("${data}")],);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 2,
                    color: Colors.black,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

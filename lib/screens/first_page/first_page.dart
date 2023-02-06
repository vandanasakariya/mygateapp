import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api/city_modal.dart';
import '../../controller/mygate_controller.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final MyGateController myGateController = Get.put(MyGateController());

  List<CityModal> cityMoal = <CityModal>[];

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("ccc${cityMoal}");
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: cityMoal.length,
                itemBuilder: (BuildContext context, int index) {
                  /* final data = myGateController
                          .cityModal.value.allStatusDownloader?.appId;*/
                  return Column(
                    children: [
                      Text(
                          "${myGateController.cityModal.value.allStatusDownloader?.appId}"),
                      Text("${myGateController.cityModal.value.splitify}"),
                      Text("${myGateController.cityModal.value.pdfReader}"),
                      Text(
                          "${myGateController.cityModal.value.callerLocationTracker}"),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 2,
                    color: Colors.black,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

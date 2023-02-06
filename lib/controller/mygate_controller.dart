import 'package:get/get.dart';
import 'package:mygateapp/api/city_modal.dart';
import 'package:mygateapp/api/service.dart';

class MyGateController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    print("response----- 0:- 00000 ");

    SearchMethod();
    super.onInit();
  }

  Rx<CityModal> cityModal = CityModal().obs;

  Future<CityModal?> SearchMethod() async {
    final result = await CityService.getdata();
    if (result != null) {
      cityModal.value = result ;
    }

  }
}

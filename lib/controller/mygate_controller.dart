import 'package:get/get.dart';
import 'package:mygateapp/api/city_modal.dart';
import 'package:mygateapp/api/service.dart';

class MyGateController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    SearchMethod();
    super.onInit();
  }

  Rx<CityModal> cityModal = CityModal().obs;

  Future<void> SearchMethod() async {
    final result = await CityService.getCity();
    if (result != null) {
      cityModal.value.msg = result as String?;
    }
  }
}

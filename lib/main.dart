import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/mygate_controller.dart';
import 'navigation_utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.welcomePage,
      getPages: Routes.pages,
     // initialBinding: AppBidding(),

    );
  }
}
/*class AppBidding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyGateController());

    //Get.put(FestivalController());
  }
}*/


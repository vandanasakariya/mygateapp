import 'package:get/get.dart';
import 'package:mygateapp/screens/first_page/first_page.dart';
import 'package:mygateapp/screens/second_screen/second_screen.dart';
import 'package:mygateapp/screens/welcome_page/welcome_page.dart';

mixin Routes {
  static const defaultTransition = Transition.rightToLeft;
  static const welcomePage = "/welcomePage";
  static const firstPage = "/FirstPage";
  static const secondPage = "/SecondPage";


  static List<GetPage<dynamic>> pages = [
    GetPage<dynamic>(
      name: welcomePage,
      page: () => WelcomePage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: firstPage,
      page: () => FirstPage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: secondPage,
      page: () => SecondPage(),
      transition: defaultTransition,
    ),
  ];
}

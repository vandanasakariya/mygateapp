import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mygateapp/api/city_modal.dart';
import 'package:mygateapp/theam/app_string.dart';
import 'package:mygateapp/widget/custom_text.dart';
import '../../controller/mygate_controller.dart';
import '../../navigation_utils/navigation.dart';
import '../../navigation_utils/routes.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final MyGateController myGateController = Get.put(MyGateController());
  final TextEditingController searchCityController = TextEditingController();
  List<CityModal>? recipes;
  List<CityModal>? search_recipes;

  bool _searchBoolean = false;

  String _searchText = "";

  @override
  void initState() {
    super.initState();
  }

  List<String>? s = [];

  @override
  Widget build(BuildContext context) {
    // s = myGateController.cityList.value.city;
    // print("ppppp${s}"); ketli var lagse
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: !_searchBoolean
              ? CustomText(text: AppString.selectCity)
              : _searchTextField(),
          actions: !_searchBoolean
              ? [
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          _searchBoolean = true;
                        });
                      })
                ]
              : [
                  IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _searchBoolean = false;
                        });
                      })
                ],
        ),
        body: Column(
          children: [
            Obx(
              () => Expanded(
                child: ListView.separated(
                  itemCount: myGateController.searchCityList.length == 0
                      ? (myGateController.cityList.value.city?.length ?? 0)
                      : myGateController.searchCityList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (myGateController.searchCityList.isNotEmpty) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: GestureDetector(
                              child: Text(
                                  "${myGateController.searchCityList.value[index].city}"),
                              onTap: () {
                                Navigation.pushNamed(Routes.secondPage, arg: {
                                  "apidata": myGateController
                                      .cityList.value.city?[index]
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    }

                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            child: Text(
                                "${myGateController.cityList.value.city?[index]}"),
                            onTap: () {
                              print("Dfffd");
                              Navigation.pushNamed(Routes.secondPage, arg: {
                                "apidata":
                                    myGateController.cityList.value.city?[index]
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 1,
                      color: Colors.grey.shade100,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchTextField() {
    return TextFormField(
      onChanged: (val) {
         final it = myGateController.cityModalList
              .where((element) => element.city.toString()
              .toLowerCase().trim()
              .contains(val.toLowerCase()))
              .toList();
          myGateController.searchCityList.addAll(it);
          print("search value-------------- :0 $val");
      },
      controller: searchCityController,
      autofocus: true,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      //textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search', //Text that is displayed when nothing is entered.
        hintStyle: TextStyle(
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }
}

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
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final MyGateController myGateController = Get.put(MyGateController());
  bool _searchBoolean = false;


  @override
  void initState() {
    //myGateController.getCityList(name:myGateController.first.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () async {
                      setState(() {
                        _searchBoolean = true;
                        myGateController.cityList.value.city;
                      });
                      print("object");
                    },
                    icon: Icon(Icons.search),
                  ),
                ]
              : [
                  IconButton(
                    onPressed: () async {
                      setState(() {
                        _searchBoolean = false;
                      });
                      print("object");
                    },
                    icon: Icon(Icons.clear),
                  ),
                ],
        ),
        body: Obx(
          () => Column(
            children: [
              !_searchBoolean
                  ? Expanded(
                      child: ListView.separated(
                        itemCount:
                            myGateController.cityList.value.city?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                  child: Text(
                                      "${myGateController.cityList.value.city?[index]}"),
                                  onTap: () {
                                    print("Dfffd");
                                    Navigation.pushNamed(Routes.secondPage,
                                        arg: {
                                          "apidata": myGateController
                                              .cityList.value.city?[index]
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
                    )
                  : _searchListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchListView() {
    return ListView.builder(
        itemCount: myGateController.cityList.value.city?.length ?? 0,
        itemBuilder: (context, index) {
          var data= myGateController.cityList.value.city?.length ?? 0;
          return  Card(
              child: ListTile(
                  title: Text(myGateController.cityList.value.city![index])));
        });
  }

  Widget _searchTextField() {
    return TextField(
      onChanged: (String s) {
        setState(() {
         myGateController.second.text;
        });
      },
      autofocus: true,
      controller: myGateController.second,
      //Display the keyboard when TextField is displayed
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      //Specify the action button on the keyboard
      decoration: InputDecoration(
        //Style of TextField
        enabledBorder: UnderlineInputBorder(
            //Default TextField border
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: UnderlineInputBorder(
            //Borders when a TextField is in focus
            borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search', //Text that is displayed when nothing is entered.
        hintStyle: TextStyle(
          //Style of hintText
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }
}

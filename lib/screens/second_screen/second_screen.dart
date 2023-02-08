import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mygateapp/navigation_utils/size_utils.dart';
import 'package:mygateapp/theam/app_string.dart';
import 'package:mygateapp/widget/custom_text.dart';
import 'package:mygateapp/widget/custom_textfield.dart';

import '../../controller/mygate_controller.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

final MyGateController myGateController = Get.find();

class _SecondPageState extends State<SecondPage> {
  @override
  void initState() {
    super.initState();
  }

  var apicl;
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
   myGateController.first.text= data["apidata"];
    print("myyyyy${myGateController.first.text}");
    //myGateController.cityList.value.city?.length=myGateController.first as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(text: AppString.addHome),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeUtils.verticalBlockSize * 2,
              horizontal: SizeUtils.horizontalBlockSize * 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppString.city,
              ),
              SizedBox(height: SizeUtils.horizontalBlockSize * 2),
              CustomTextField(
                contentPadding: EdgeInsets.fromLTRB(15, 0, 20, 11),
                controller: myGateController.first,
              ),
              SizedBox(height: SizeUtils.horizontalBlockSize * 4),
              CustomText(
                text: AppString.society,
              ),
              SizedBox(height: SizeUtils.horizontalBlockSize * 2),
              CustomTextField(
                contentPadding: EdgeInsets.fromLTRB(15, 0, 20, 11),
                hintText: AppString.searchYrSocietyNm,
                controller: myGateController.second,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

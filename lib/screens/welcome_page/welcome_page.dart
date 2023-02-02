import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mygateapp/navigation_utils/size_utils.dart';
import 'package:mygateapp/theam/app_string.dart';
import 'package:mygateapp/widget/custom_text.dart';
import '../../navigation_utils/navigation.dart';
import '../../navigation_utils/routes.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          exit(0);
        },
        child: Scaffold(
          body: Column(
            children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: SizeUtils.verticalBlockSize * 70,
                    left: SizeUtils.verticalBlockSize * 13,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: SizeUtils.horizontalBlockSize * 13,
                    width: SizeUtils.verticalBlockSize * 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.pinkAccent.shade100,
                    ),
                    child: CustomText(
                      text: AppString.addYourHome,
                      fontSize: SizeUtils.fSize_16(),
                    ),
                  ),
                ),
                onTap: () {
                  Navigation.pushNamed(Routes.firstPage);
                  print("tap");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

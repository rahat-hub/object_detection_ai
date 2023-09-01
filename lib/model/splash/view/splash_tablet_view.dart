

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_detection_ai/constant_data/constant_assets.dart';
import 'package:object_detection_ai/constant_data/constant_size.dart';
import 'package:object_detection_ai/model/splash/splash_logic.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SplashTablet extends GetView<SplashLogic> {
  final SizingInformation? sizingInformation;

  const SplashTablet({
    Key? key,
    this.sizingInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashLogic>();
    //Get.find<InternetCheckerHelperLogic>();
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: sizingInformation!.localWidgetSize.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    child: Image.asset(ConstantAssets.logo),
                  ),
                ),
                const SizedBox(
                  height: SizeConstant.CONTENTSPACING + 20,
                ),
                const CupertinoActivityIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
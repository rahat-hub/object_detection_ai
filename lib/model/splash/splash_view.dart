import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_detection_ai/model/splash/view/splash_mobile_view.dart';
import 'package:object_detection_ai/model/splash/view/splash_tablet_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'splash_logic.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return ScreenTypeLayout.builder(
        mobile: (context) => OrientationLayoutBuilder(
          portrait: (context) => SplashMobilePortrait(sizingInformation: sizingInformation),
          landscape: (context) => SplashMobileLandscape(sizingInformation: sizingInformation),
        ),
        tablet: (context) => SplashTablet(sizingInformation: sizingInformation),
      );
    });
  }
}

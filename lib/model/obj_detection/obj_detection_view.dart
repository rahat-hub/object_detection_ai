import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'view/obj_detection_mobile_view.dart';
import 'view/obj_detection_tablet_view.dart';

class ObjDetectionPage extends StatelessWidget {
  const ObjDetectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return ScreenTypeLayout.builder(
        mobile: (context) => OrientationLayoutBuilder(
          portrait: (context) => ObjectDetectionMobilePortrait(sizingInformation: sizingInformation),
          landscape: (context) => ObjectDetectionMobileLandscape(sizingInformation: sizingInformation),
        ),
        tablet: (context) => ObjectDetectionTablet(sizingInformation: sizingInformation),
      );
    });
  }
}

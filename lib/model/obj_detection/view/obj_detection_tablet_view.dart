import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_detection_ai/model/obj_detection/obj_detection_logic.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ObjectDetectionTablet extends GetView<ObjDetectionLogic> {
  final SizingInformation? sizingInformation;

  const ObjectDetectionTablet({
    Key? key,
    this.sizingInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ObjDetectionLogic>();
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Object Detection",style: TextStyle(fontSize: Theme.of(Get.context!).textTheme.titleMedium!.fontSize!),textAlign: TextAlign.center)),
        ),
        body: GetBuilder<ObjDetectionLogic>(
          init: ObjDetectionLogic(),
          builder: (controller) {
            return controller.isCameraInitialized.value ? CameraPreview(controller.cameraController) : const Center(child:Text('Loading Preview...'));
          },
        ),
      ),
    );
  }
}
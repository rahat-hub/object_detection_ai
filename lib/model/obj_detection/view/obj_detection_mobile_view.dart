import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_detection_ai/constant_data/constant_color.dart';
import 'package:object_detection_ai/model/obj_detection/obj_detection_logic.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ObjectDetectionMobilePortrait extends GetView<ObjDetectionLogic> {
  final SizingInformation? sizingInformation;

  const ObjectDetectionMobilePortrait({
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
          title: Center(
              child: Text("Object Detection",
                  style: TextStyle(fontSize: Theme
                      .of(Get.context!)
                      .textTheme
                      .titleMedium!
                      .fontSize!), textAlign: TextAlign.center)),
        ),
        body: Obx(() {
          return controller.isLoading.isFalse ? GetBuilder<ObjDetectionLogic>(
            init: ObjDetectionLogic(),
            builder: (controller) {
              return controller.isCameraInitialized.value
                  ? SingleChildScrollView(
                    child: Column(
                      children: [
              //         Stack(children: [
              //   CameraPreview(controller.cameraController),
              //   Positioned(
              //         top: (controller.y) * 100,
              //         right: (controller.x) * 200,
              //         child: Container(
              //           width: controller.w * 100 * context.width / 100,
              //           height: controller.h * 100 * context.height / 100,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(8.0),
              //             border: Border.all(color: ColorConstants.GREEN, width: 2.0),
              //           ),
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               Container(color: ColorConstants.WHITE, child: Text(controller.label))
              //             ],
              //           ),
              //         ),
              //   ),
              // ]),
                        Stack(children: [
                          SizedBox(
                              width: Get.width,
                              height: Get.height - 200,
                              child: CameraPreview(controller.cameraController)),
                          Container(
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: ColorConstants.GREEN, width: 2.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(color: ColorConstants.WHITE, child:  Text(controller.result))
                              ],
                            ),
                          ),
                        ]),
                        Row(
                          children: [
                            ElevatedButton(onPressed: () {
                              controller.isCameraInitialized.value = false;
                              controller.cameraController.dispose();
                            }, child: const  Text("Stop Camera")),
                            const SizedBox(width: 20,),
                            ElevatedButton(onPressed: () async {
                              await controller.initCamera();
                              await controller.initTFLite();
                            }, child: const  Text("Open Camera"))
                          ],
                        ),

                      ],
                    ),
                  )
                  : Center(child: Column(
                    children: [
                      const Text('Loading Preview...'),
                      Row(
                        children: [
                          ElevatedButton(onPressed: () {
                            controller.isCameraInitialized.value = false;
                            controller.cameraController.dispose();
                          }, child: const  Text("Stop Camera")),
                          const SizedBox(width: 20,),
                          ElevatedButton(onPressed: () async {
                            await controller.initCamera();
                            await controller.initTFLite();
                          }, child: const  Text("Open Camera"))
                        ],
                      ),
                    ],
                  ));
            },
          ) : const SizedBox();
        }),
      ),
    );
  }
}

class ObjectDetectionMobileLandscape extends GetView<ObjDetectionLogic> {
  final SizingInformation? sizingInformation;

  const ObjectDetectionMobileLandscape({
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
          title: Center(
              child: Text("Object Detection",
                  style: TextStyle(fontSize: Theme
                      .of(Get.context!)
                      .textTheme
                      .titleMedium!
                      .fontSize!), textAlign: TextAlign.center)),
        ),
        body: GetBuilder<ObjDetectionLogic>(
          init: ObjDetectionLogic(),
          builder: (controller) {
            return controller.isCameraInitialized.value
                ? Stack(children: [
              CameraPreview(controller.cameraController),
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: ColorConstants.GREEN, width: 2.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(color: ColorConstants.WHITE, child:  Text(controller.label))
                  ],
                ),
              ),
            ])
                : const Center(child: Text('Loading Preview...'));
          },
        ),
      ),
    );
  }
}

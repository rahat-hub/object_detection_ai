import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:object_detection_ai/constant_data/constant_assets.dart';

import 'package:permission_handler/permission_handler.dart';

class ObjDetectionLogic extends GetxController {

  var isLoading = false.obs;

  late CameraController cameraController;

  late List<CameraDescription> cameras;

  late CameraImage cameraImage;

  var isCameraInitialized = false.obs;

  var cameraCount = 0;

  var x = 0.0, y = 0.0, w = 0.0, h = 0.0;

  var label = "";

  var result = "";

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    isLoading.value = true;
    initTFLite();
    initCamera();
    isLoading.value = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    cameraController.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    Tflite.close();
  }

  initCamera() async {
    if (await Permission.camera.request().isGranted) {
      cameras = await availableCameras();
      cameraController = CameraController(cameras[0], ResolutionPreset.max, enableAudio: false, imageFormatGroup: ImageFormatGroup.yuv420);
      await cameraController.initialize().then((value) {
        cameraCount++;
        cameraController.startImageStream((image) {
          cameraCount++;
          if (cameraCount % 50 == 0) {
            cameraCount = 0;
            objectDetector(image);
          }
          update();
        });
      });
      isCameraInitialized(true);
      update();
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(content: Text("Permission denied")));
    }
  }

  initTFLite() async {
    await Tflite.loadModel(
      model: ConstantAssets.tFModels,
      labels: ConstantAssets.tFLabels,
      isAsset: true,
      numThreads: 1,
      useGpuDelegate: false,
    );
  }

  objectDetector(CameraImage image) async {
    var detector = await Tflite.runModelOnFrame(
        bytesList: image.planes.map((e) {
          return e.bytes;
        }).toList(),

        imageHeight: image.height,
        imageWidth: image.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.2,
        asynch: true
    );

    result = "";

    detector?.forEach((data) {

      print("************************************");
      print(data);
      print("************************************");

      result += data["label"] + " " + (data["confidence"] as double).toStringAsFixed(2) + "\n\n";

      // data.map((re){
      //   x = re["rect"]["x"];
      //   y = re["rect"]["y"];
      //   w = re["rect"]["w"];
      //   h = re["rect"]["h"];
      // }).toList();

      print(x);
      print(y);
      print(w);
      print(h);

    });
    update();

    // print(detector);
    //
    // if (detector == null) {
    //   return [];
    // }
    // else {
    //   detector.map((result) {
    //     print("*************************");
    //     print(result);
    //     print("*************************");
    //
    //     h = result["rect"]["h"];
    //     w = result["rect"]["w"];
    //     x = result["rect"]["x"];
    //     y = result["rect"]["y"];
    //     label = result["detectedClass"];
    //   }).toList();
    // }

    // return detector.map((result){
    //   return Positioned(
    //
    //   );
    // }
    // }).toList();

    //if(detector != null) {

    // try {
    //   var ourDetectedObject = detector?.first;
    //
    //   label = detector?.first["label"];
    //
    //   print(detector?.first);
    //
    //   print("@********************** ${detector!.first['detectedClass'].toString()}");
    //
    //   print(ourDetectedObject['confidenceInClass']);
    //
    //   if (ourDetectedObject['confidenceInClass'] * 100 > 45) {
    //     label = detector!.first['detectedClass'].toString();
    //     print("wwwwwwwwwwwwwwww $label");
    //     h = ourDetectedObject['rect']['h'];
    //     w = ourDetectedObject['rect']['w'];
    //     x = ourDetectedObject['rect']['x'];
    //     y = ourDetectedObject['rect']['y'];
    //
    //     print("X : $x");
    //     print("y : $y");
    //     print("w : $w");
    //     print("h : $h");
    //   }
    //   update();
    // } on PlatformException catch (e) {
    //   label = "note Found in tfLite model";
    //   print(e);
    // }
  }
}

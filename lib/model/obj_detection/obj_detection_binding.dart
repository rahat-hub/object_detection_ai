import 'package:get/get.dart';

import 'obj_detection_logic.dart';

class ObjDetectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ObjDetectionLogic());
  }
}

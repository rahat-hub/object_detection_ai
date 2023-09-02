import 'package:get/get.dart';
import 'package:object_detection_ai/routes/app_routes.dart';

class SplashLogic extends GetxController {

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 3));
    await newPageLoad();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  newPageLoad() {
    Get.offNamed(Routes.dashboard);
  }
}

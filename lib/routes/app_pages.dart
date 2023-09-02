import 'package:get/get.dart';
import 'package:object_detection_ai/model/dash_board/dash_board_binding.dart';
import 'package:object_detection_ai/model/dash_board/dash_board_view.dart';
import 'package:object_detection_ai/model/obj_detection/obj_detection_binding.dart';
import 'package:object_detection_ai/model/obj_detection/obj_detection_view.dart';
import 'package:object_detection_ai/model/splash/splash_binding.dart';
import 'package:object_detection_ai/model/splash/splash_view.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(name: Routes.splash, page: () => const SplashPage(), bindings: [
      SplashBinding(),
    ]),
    GetPage(name: Routes.objectDetection, page: () => const ObjDetectionPage(), bindings: [
      ObjDetectionBinding(),
    ]),
    GetPage(name: Routes.dashboard, page: () => const DashBoardPage(), bindings: [
      DashBoardBinding(),
    ]),
  ];
}

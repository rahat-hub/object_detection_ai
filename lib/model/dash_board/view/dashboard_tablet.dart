
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_detection_ai/model/dash_board/dash_board_logic.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DashboardTablet extends GetView<DashBoardLogic> {

  final SizingInformation? sizingInformation;

  const DashboardTablet({super.key,this.sizingInformation});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

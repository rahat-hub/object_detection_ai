
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:object_detection_ai/constant_data/constant_color.dart';
import 'package:object_detection_ai/constant_data/constant_size.dart';
import 'package:object_detection_ai/model/dash_board/dash_board_logic.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DashboardMobilePortrait extends GetView<DashBoardLogic> {

  final SizingInformation? sizingInformation;

  const DashboardMobilePortrait({super.key,this.sizingInformation});

  @override
  Widget build(BuildContext context) {

    Get.find<DashBoardLogic>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("AI Dashboard",style: TextStyle(fontSize: Theme.of(context).textTheme.titleMedium!.fontSize! + 3,fontWeight: FontWeight.bold))),
        ),
        drawer: const Drawer(
          child: Column(
            children: [
              Text("In_complete")
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: controller.featureData.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,item){
                    return SizedBox(
                      width: 120,
                      child: Card(
                        color: ColorConstants.GREY.withOpacity(0.5),
                        child: ListTile(
                          title: Text(controller.featureData[item]["name"].toString()),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: SizeConstant.CONTENTSPACING),
              Material(
                color: Colors.green,
                child: RichText(
                  text: TextSpan(
                    text: "Ai Description",
                    style: TextStyle(fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: controller.aiDescription,
                        style: TextStyle(wordSpacing: 1.5,)
                      )
                    ]

                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DashboardMobileLandscape extends GetView<DashBoardLogic> {

  final SizingInformation? sizingInformation;

  const DashboardMobileLandscape({super.key,this.sizingInformation});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

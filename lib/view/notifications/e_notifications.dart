/*
import 'package:copter/controller/notification_controller/notification_controller.dart';
*/
import 'package:copter/view/widget/custom_app_bar.dart';
import 'package:copter/view/widget/notification_tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ENotifications extends StatelessWidget {
  const ENotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (controller) {*/
        return  Scaffold(
          appBar:  CustomAppBarWithLogo(
          ),
            body: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 60,
              top: 20,
            ),
            physics: const BouncingScrollPhysics(),
            //itemCount: controller.getDummyEmployeeNotifications.length,
              itemCount: 7,
            itemBuilder: (context, index) {
              //var data = controller.getDummyEmployeeNotifications[index];
              return NotificationTiles(
                msg: "Create a mobile app has been updated by you",
                time:"10 Jan, 2022 | 10.36 am",
                requestToJoin: true,
              );
            },
          ),
        );

  }
}

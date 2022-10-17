/*
import 'package:copter/controller/notification_controller/notification_controller.dart';
*/
import 'package:copter/view/widget/custom_app_bar.dart';
import 'package:copter/view/widget/notification_tiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CNotifications extends StatelessWidget {
  const CNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*eturn GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (controller) {*/
        return const Scaffold(
          appBar:  CustomAppBarWithLogo(
          ),
          body:Center(
            child: Text("c_notofication.dart"),
          )
          /*ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 60,
              top: 20,
            ),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.getDummyCompanyNotifications.length,
            itemBuilder: (context, index) {
              var data = controller.getDummyCompanyNotifications[index];
              return NotificationTiles(
                msg: data.msg,
                time: data.time,
                requestToJoin: data.requestToJoin,
              );
            },
          ),*/
        );
     /* },
    );*/
  }
}

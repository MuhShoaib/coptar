/*
import 'package:copter/controller/public_profile_controller/public_profile_controller.dart';
*/
import 'package:copter/view/constant/colors.dart';
import 'package:copter/view/constant/other.dart';
import 'package:copter/view/public_profile/public_profile_detail.dart';
import 'package:copter/view/widget/custom_app_bar.dart';
import 'package:copter/view/widget/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicProfile extends StatelessWidget {
  const PublicProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   /* return GetBuilder<PublicProfileController>(
      init: PublicProfileController(),
      builder: (controller) {*/
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Profile',
          ),

          body: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
         itemCount: 4,
         /*   itemCount: controller.getDummyProfiles.length,*/
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
             // var data = controller.getDummyProfiles[index];
              return publicProfileTiles(
               "profileImage",
                "John Doe",
                "Ui UX Designer",
              );
            },
          ),
        );

  }

  Widget publicProfileTiles(String? profileImage, name, status) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: RadiusHandler.radius10,
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 8,
            color: kBlackColor.withOpacity(0.04),
          ),
        ],
      ),
      child: ListTile(
        onTap: () => Get.to(
          () => PublicProfileDetail(
            profileImage: profileImage,
            name: name,
            status: status,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        leading: ClipRRect(
          borderRadius: RadiusHandler.radius10,
          child: Image.asset(
            profileImage!,
            fit: BoxFit.cover,
            height: 50,
            width: 50,
          ),
        ),
        title: MyText(
          text: name,
          weight: FontWeight.w500,
        ),
        subtitle: MyText(
          text: status,
          size: 12,
        ),
      ),
    );
  }
}

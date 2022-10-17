/*
import 'package:copter/controller/chat_controller/chat_controller.dart';
*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copter/Models/userModel.dart';
import 'package:copter/view/constant/colors.dart';
import 'package:copter/view/constant/images.dart';
import 'package:copter/view/widget/my_text.dart';
import 'package:copter/view/widget/send_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/chatController.dart';
import '../../Controllers/userController.dart';
import 'chat_head.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  ChatScreen({
    Key? key,
    // this.receiveImage,
    // this.receiveName,
    // this.online,
    this.employeModel,
  }) : super(key: key);

  UserModel? employeModel;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // ignore: prefer_typing_uninitialized_variables
  TextEditingController msg = TextEditingController();
  UserController userController = Get.put(UserController());
  ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        elevation: 0,
        leadingWidth: 110,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset(
                  kArrowBack,
                  width: 24,
                ),
              ),
            ),
            personProfileImage(
              "assets/images/dummy_chat/skylar.png",
              true,
            ),
          ],
        ),
        title: MyText(
          text: widget.employeModel!.email,
          weight: FontWeight.w600,
          color: kBlackColor2,
        ),
        actions: [
          Center(
            child: Image.asset(
              kAudioCallIcon,
              height: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Image.asset(
                kVideoCallIcon,
                height: 40,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 40),
            child: FutureBuilder(
                future: chatController.getChat(
                  employeeUid: widget.employeModel!.userId,
                  company: userController.companyType.value,
                  currentUserid: userController.uid.value,
                ),
                builder: (context, snapshot) {
                  return Obx(() => ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        physics: const BouncingScrollPhysics(),
                        itemCount: chatController.chatList.value.length,
                        itemBuilder: (context, index) {
                          /*var data = controller.getDummyMsg[index];*/
                          var data = chatController.chatList.value[index];
                          return ChatBubble(
                            index: index,
                          );
                        },
                      ));
                }),
          ),
          SendField(
            controller: msg,
            hintText: 'type here...',
            onTap: () async {
              String message = msg.text.toString();
              int time = DateTime.now().microsecondsSinceEpoch;
              setState(() {
                msg.text = "";
                // isnotEmpty = false;
              });
              print(userController.email.value);
              await FirebaseFirestore.instance
                  .collection(userController.companyType.value)
                  .doc("users")
                  .collection("users")
                  .doc(userController.uid.value)
                  .collection("inbox")
                  .doc(widget.employeModel!.userId)
                  .set({
                "email": widget.employeModel!.email,
                "userId": widget.employeModel!.userId,
                "name": widget.employeModel!.name,
              });

              await FirebaseFirestore.instance
                  .collection(userController.companyType.value)
                  .doc("users")
                  .collection("users")
                  .doc(userController.uid.value)
                  .collection("inbox")
                  .doc("${widget.employeModel!.userId}")
                  .collection("chat")
                  .doc("${time}")
                  .set({"msg": message, "time": time, "IsMe": true});

              /////////////////////////////
              await FirebaseFirestore.instance
                  .collection(userController.companyType.value)
                  .doc("users")
                  .collection("users")
                  .doc("${widget.employeModel!.userId}")
                  .collection("inbox")
                  .doc(userController.uid.value)
                  .set({
                // "name": FirebaseAuth.instance.currentUser!.uid,
                "userId": userController.uid.value,
                "email": userController.email.value
              });
              await FirebaseFirestore.instance
                  .collection(userController.companyType.value)
                  .doc("users")
                  .collection("users")
                  .doc("${widget.employeModel!.userId}")
                  .collection("inbox")
                  .doc(userController.uid.value)
                  .collection("chat")
                  .doc("${time}")
                  .set({"msg": message, "time": time, "IsMe": false});
            },
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ChatBubble extends StatelessWidget {
  ChatBubble({
    Key? key,
    // this.msg,
    // this.time,
    // this.isSeen,
    // this.senderType,
    required this.index,
  }) : super(key: key);

  final int index;

  ChatController chatController = Get.put(ChatController());

  // String? msg, time, senderType;
  // bool? isSeen;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: !chatController.chatList[index].isme
          ? Alignment.topLeft
          : Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.08),
              offset: const Offset(0, 1),
              blurRadius: 4,
            ),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 30),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10.0,
          children: [
            MyText(
              text: '${chatController.chatList[index].message}',
            ),
            MyText(
              text: '${chatController.chatList[index].isme}',
              size: 10,
            ),
            //   isSeen!
            //       ? Image.asset(
            //           kDoubleTick,
            //           height: 10,
            //         )
            //       : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

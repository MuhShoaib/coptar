//create user controller getx

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copter/Models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//create getx login controller
class UserController extends GetxController {
  //create firebase auth instance
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<String> uid = ''.obs;
  Rx<String> email = ''.obs;
  Rx<String> name = ''.obs;
  Rx<String> phone = ''.obs;
  late Rx<Image> profileImage;
  Rx<String> userType = ''.obs;
  Rx<String> companyType = ''.obs;
  Rx<String> tagline = ''.obs;

  RxList<UserModel> employeList = <UserModel>[].obs;
  RxList<UserModel> dummyEmploye = <UserModel>[].obs;

  Future<void> startUserDataStream() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid.value)
        .snapshots()
        .listen((event) {
      // print(event.data()!['name']);
      //
      // print(event.data()!['email']);
      // print(event.data()!['phone']);
      // print(event.data()!['type']);
      // print(event.data()!['companyType']);
      // print(event.data()!['tagline']);

      name.value = event.data()!['name'];
      email.value = event.data()!['email'];
      phone.value = event.data()!['phone'];
      userType.value = event.data()!['type'];
      companyType.value = event.data()!['companyType'];
      tagline.value = event.data()!['tagline'];

      prefs.setString('email', email.value);
      prefs.setString('name', name.value);
      prefs.setString('phone', phone.value);
      prefs.setString('userType', userType.value);
      prefs.setString('companyType', companyType.value);
      prefs.setString('tagline', tagline.value);
    });
  }

  ///////////////////////////////////////////
  Future<void> updateEmaolyeName(String text) async {
    try {
      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection("users")
          .doc(uid.value)
          .update({
        "name": text,
      });

      name.value = text;

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('name', name.value);
    } on Exception catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  Future<void> updateEmaolyeTagline(String text) async {
    try {
      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection("users")
          .doc(uid.value)
          .update({
        "tagline": text,
      });

      tagline.value = text;

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('tagline', tagline.value);
    } on Exception catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  Future<void> updateEmaolyeEmail(String text) async {
    try {
      await FirebaseAuth.instance.currentUser!.updateEmail(text);

      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection("users")
          .doc(uid.value)
          .update({
        "email": text,
      });
      email.value = text;

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('email', email.value);
    } on Exception catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  Future<void> updateEmpolyePassword(String text) async {
    try {
      await FirebaseAuth.instance.currentUser!.updatePassword(text);

      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection("users")
          .doc(uid.value)
          .update({
        "password": text,
      });

      FirebaseFirestore.instance.doc("users/$uid").update({
        "password": text,
      });
    } on Exception catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  ///////////////////////////////////////////

  Future<void> updateUserName(String text) async {
    try {
      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection(uid.value)
          .doc("info").update({
        "name": text,
      });
      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection("users")
          .doc(uid.value)
          .update({
        "name": text,
      });


      name.value = text;

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('name', name.value);
    } on Exception catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  Future<void> updateUserTagline(String text) async {
    try {
      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection(uid.value)
          .doc("info").update({
        "tagline": text,
      });
      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection("users")
          .doc(uid.value)
          .update({
        "tagline": text,
      });

      tagline.value = text;

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('tagline', tagline.value);
    } on Exception catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  Future<void> updateUserEmail(String text) async {
    try {
      await FirebaseAuth.instance.currentUser?.updateEmail(text);

      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection("users")
          .doc(uid.value)
          .update({
        "email": text,
      });

      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection(uid.value)
          .doc("info")
          .update({
        "email": text,
      });
      email.value = text;

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('email', email.value);
    } on Exception catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  Future<void> updateUserPhone(String text) async {
    try {
      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection(uid.value)
          .doc("info")
          .update({
        "phone": text,
      });

      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection("users")
          .doc(uid.value)
          .update({
        "phone": text,
      });

      phone.value = text;

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('phone', phone.value);
    } on Exception catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  Future<void> updateUserPassword(String text) async {
    try {
      await FirebaseAuth.instance.currentUser?.updatePassword(text);

      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection(uid.value)
          .doc("info")
          .update({
        "password": text,
      });

      FirebaseFirestore.instance.doc("users/$uid").update({
        "password": text,
      });
    } on Exception catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }
  }

  Future<void> generateEmployeeAccounts(
      {required int numberOfEmployeesToGenerate}) async {
    print("generateEmployeeAccounts");

    for (int i = 0; i < numberOfEmployeesToGenerate; i++) {
      try {
        var data = await FirebaseFirestore.instance
            .collection(companyType.value)
            .doc("users")
            .collection("users")
            .get();

        int employeeCount = data.docs.length + 1;

        String newEmail =
            "employee$employeeCount@${companyType.value.toString().replaceAll(" ", "")}.com"
                .toLowerCase();
        String newPassword = "123456";

        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: newEmail, password: newPassword)
            .then((value) async {
          FirebaseFirestore.instance
              .collection("users")
              .doc(value.user!.uid)
              .set({
            "name": "Employee $employeeCount",
            "email": newEmail,
            "password": newPassword,
            "phone": "1234567890",
            "type": "employee",
            "companyType": companyType.value,
            "tagline": "Employee @${companyType.value}",
          });

          FirebaseFirestore.instance
              .collection(companyType.value)
              .doc("users")
              .collection("users")
              .doc(value.user!.uid)
              .set({
            "email": newEmail,
            "password": newPassword,
            "userId": value.user!.uid,
          });
        });
      } on Exception catch (e) {
        Get.snackbar(
          "Error",
          e.toString(),
        );
      }
    }

    // print(data.docs.length);
    // for (var employee in data.docs) {
    //   print(employee.data());
    // }
  }

  Future<void> getEmployess({required String currentUserid}) async {
    print("get");

    try {
      // var data=  await FirebaseFirestore.instance
      //      .collection(companyType.value)
      //      .doc("users")
      //      .collection("users").doc()
      //      .get();

      await FirebaseFirestore.instance
          .collection(companyType.value)
          .doc("users")
          .collection("users")
          .snapshots()
          .listen((event) {
        employeList.value = UserModel.jsonToListView(event.docs)
            .where((element) => element.userId != currentUserid)
            .toList();
      });
    } on Exception catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }

    // print(data.docs.length);
    // for (var employee in data.docs) {
    //   print(employee.data());
    // }
  }

//get data from firebase
// void getUserData() async {
//   try {
//     User? user = _auth.currentUser;
//     uid = user!.uid;
//     email = user.email!;
//     name = user.displayName!;
//     // profileImage = user.photoURL!;
//   } catch (e) {
//     Get.snackbar("Error", e.toString());
//   }
// }
}

import 'package:copter/Controllers/loginController.dart';
import 'package:copter/Controllers/userController.dart';
import 'package:copter/routes/routes.dart';
import 'package:copter/view/constant/app_styling.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initBindings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (UserController userController) {
      return GetMaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        title: 'Copter',
        theme: AppStyling.styling,
        initialRoute: AppLinks.splashScreen,
        getPages: AppRoutes.pages,
        themeMode: ThemeMode.light,
      );
    });
  }
}

Future<void> initBindings() async {
  Get.lazyPut<LoginController>(() => LoginController());
  Get.lazyPut<UserController>(() => UserController());
}

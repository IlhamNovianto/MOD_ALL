import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager_on_duty/View/ChoseBuilding/pilih_building.dart';
import 'package:manager_on_duty/View/LoginView/LoginView.dart';
import 'package:manager_on_duty/View/SplashScreen/SplashScreen.dart';

void main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/pilih-building',
    getPages: [
      GetPage(name: '/pilih-building', page: () => const Pilihbuilding()),
      GetPage(
          name: '/splash', page: () => SplashScreen(building: Get.arguments)),
      GetPage(
          name: '/login',
          page: () => LoginPage(
                login: Get.arguments,
              )),
      //GetPage(name: '/home', page: () => const HomePage()),
    ],
  ));
}

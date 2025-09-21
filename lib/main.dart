import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager_on_duty/View/ChoseBuilding/pilih_building.dart';
import 'package:manager_on_duty/View/LoginView/LoginView.dart';
import 'package:manager_on_duty/View/SplashScreen/SplashScreen.dart';

void main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MOD App',
    initialRoute: '/pilih-building', // route awal
    getPages: [
      GetPage(name: '/pilih-building', page: () => const Pilihbuilding()),
      GetPage(
          name: '/splash',
          page: () => SplashScreen(
              building: Get.arguments)), // nanti bisa dikirim building
      GetPage(
          name: '/login',
          page: () => LoginPage(
                login: Get.arguments,
              )),
      //GetPage(name: '/home', page: () => const HomePage()),
    ],
  ));
  // (const GetMaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   home: Pilihbuilding(),
  // ));
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager_on_duty/View/SplashScreen/SplashScreen_Controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController splashScreenController =
      Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/LogoMod.png'),
                          fit: BoxFit.scaleDown)),
                ),
              ),
              bottomSheet: Container(
                  color: Colors.white,
                  height: 70,
                  width: 140,
                  child: Image.asset('images/gca2Logo.png')),
            ),
          );
        });
  }
}

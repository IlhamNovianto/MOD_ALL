import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager_on_duty/View/SplashScreen/SplashScreen_Controller.dart';

import '../../Config/Pilih Build/dataBuild.dart';

class SplashScreen extends StatefulWidget {
  //Contructor
  final LocationItem building;
  const SplashScreen({super.key, required this.building});

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/LogoMod.png'),
                              fit: BoxFit.scaleDown)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('For Building : '),
                    Container(
                        color: Colors.white,
                        height: 100,
                        width: 220,
                        child: Image.asset(widget.building.imgLogoBuilding
                            // widget.building.imgLogoBuilding,
                            )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager_on_duty/Config/Pilih%20Build/dataBuild.dart';
import 'package:manager_on_duty/View/ChoseBuilding/pilih_building.dart';
import 'package:manager_on_duty/View/SplashScreen/SplashScreen_Controller.dart';

import 'Widget/login_widget.dart';

class LoginPage extends StatefulWidget {
  final LocationItem login;
  const LoginPage({super.key, required this.login});
  // const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SplashScreenController splashScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.login.imgBackground),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(47, 68, 137, 255), BlendMode.color))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Container(
                            width: 400,
                            height: 420,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color:
                                    const Color.fromARGB(221, 255, 255, 255)),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: 100,
                                      width: 200,
                                      child: Image.asset(
                                          widget.login.imgLogoBuilding)),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: LoginWidget(),
                                  ),
                                  Text(
                                      'Version.${splashScreenController.versionAPP}')
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(const Pilihbuilding());
                        },
                        child: const Text(
                          "← Kembali ke Pilih Building",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

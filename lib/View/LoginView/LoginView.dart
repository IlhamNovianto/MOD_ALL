import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager_on_duty/View/SplashScreen/SplashScreen_Controller.dart';

import 'Widget/login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/GCA2.jpg'),
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
                                      child:
                                          Image.asset('images/gca2Logo.png')),
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
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

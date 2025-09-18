//Popup Login Berhasil Sebagai Maker/User
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void popUpLoginSucessMaker({String? userId}) async {
  showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return SimpleDialog(
          title: Image.asset(
            'images/icon_success.png',
            width: 75,
            height: 75,
          ),
          contentPadding: const EdgeInsets.all(20),
          children: const [
            Center(
              child: Text(
                "Login Berhasil",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Text(
              "Anda Sedang di Arahakan ke Beranda",
              textAlign: TextAlign.center,
            )
          ],
        );
      });
}

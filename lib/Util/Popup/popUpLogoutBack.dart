//Popup ketika Token Kadaluarsa
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager_on_duty/Util/helper/logout.dart';
import 'package:shared_preferences/shared_preferences.dart';

void popUpLogoutBack({String? username}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('userid');
  showDialog(
      context: Get.context!,
      builder: (context) {
        return SimpleDialog(
          title: Image.asset(
            'images/icon_warning.png',
            width: 50,
            height: 50,
          ),
          contentPadding: const EdgeInsets.all(20),
          children: [
            const Center(
              child: Text(
                "Keluar dari Aplikasi?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const Text(
              " Tekan OK",
              textAlign: TextAlign.center,
            ),
            const Text(
              "untuk kembali ke Halaman Login",
              textAlign: TextAlign.center,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('OK'),
              onPressed: () {
                //Navigator.of(context).pop();
                logout(userId: userId);
              },
            ),
          ],
        );
      });
}

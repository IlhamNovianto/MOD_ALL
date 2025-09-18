//Login Gagal
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void popFieldGetToken({String? massageError}) async {
  showDialog(
      context: Get.context!,
      builder: (context) {
        return SimpleDialog(
          title: Image.asset(
            'images/icon_error.png',
            width: 50,
            height: 50,
          ),
          contentPadding: const EdgeInsets.all(20),
          children: [
            Center(
              child: Text(
                massageError!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const Text(
              "Akun Anda Belum Terdaftar \n atau belum di Setujui,\n Silahakan Registrasi Dahulu",
              textAlign: TextAlign.center,
            )
          ],
        );
      });
}

//Login Gagal
void popUpLoginField() async {
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
          children: const [
            Center(
              child: Text(
                "UserId dan Password anda salah",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Text(
              "Pastikan UserId dan Password anda Benar.",
              textAlign: TextAlign.center,
            )
          ],
        );
      });
}

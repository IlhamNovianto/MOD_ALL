import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:manager_on_duty/Util/CheckConnection.dart';
import 'package:manager_on_duty/Util/Popup/GagalFunction.dart';
import 'package:manager_on_duty/View/SplashScreen/SplashScreen_Controller.dart';

import '../Service/Api_EndPoint.dart';
import 'Popup/CekKoneksi.dart';

Future<void> getVersionApps({required String versionAPP}) async {
  try {
    String connectionResult = await checkConnection();
    if (connectionResult.isEmpty) {
      popUpConnection();
    } else {
      var head = {
        'Content-Type': 'application/json',
      };
      String encodedVersion = Uri.encodeComponent(versionAPP);
      var url = Uri.parse(
          '$connectionResult${ApiEndPoints.getversion.version}?idv=$encodedVersion');

      http.Response responseVersion = await http.get(headers: head, url);

      if (responseVersion.statusCode == 200) {
        var responseBody = jsonDecode(responseVersion.body);
        if (responseBody['code'] == 200) {
          SplashScreenController splashScreenController = Get.find();
          splashScreenController.redirectPage();
        } else {
          updateWarning();
        }
      }
    }
  } catch (e) {
    operationField(massageError: e.toString());
  }
}

//popup untuk menampilkan warning, agar mengupload foto ke SPV
void updateWarning() async {
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
                "Aplikasi Anda Belum Update",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const Center(
              child: Text(
                "Silahkan Update dahulu",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('OK'),
              onPressed: () {
                // downloadApk(context);

                exit(0);
              },
            ),
          ],
        );
      });
}

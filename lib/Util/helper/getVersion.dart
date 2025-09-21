import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:manager_on_duty/Util/Popup/error/GagalFunction.dart';
import 'package:manager_on_duty/Util/Popup/warning/warning_out.dart';
import 'package:manager_on_duty/Util/helper/check_conection.dart';
import 'package:manager_on_duty/View/SplashScreen/SplashScreen_Controller.dart';

import '../../Service/api_endpoint.dart';
import '../Popup/CekKoneksi.dart';
import '../Popup/helperAuth.dart';

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

      http.Response responseVersion = await http
          .get(headers: head, url)
          .timeout(const Duration(seconds: 15));

      if (responseVersion.statusCode == 200) {
        var responseBody = jsonDecode(responseVersion.body);
        if (responseBody['code'] == 200) {
          SplashScreenController splashScreenController = Get.find();
          splashScreenController.redirectPage();
        } else {
          warningOut(
              title: "Aplikasi Anda Belum Update",
              massage: "Silahkan Hubungi IT, Untuk bantuan update");
        }
      }
    }
  } on SocketException {
    PopupHelper.showCenterDialog(
        "Koneksi Bermasalah", "Gagal tersambung ke server.");
  } on TimeoutException {
    PopupHelper.showCenterDialog(
        "Request Timeout", "Permintaan terlalu lama, coba lagi.");
  } on FormatException {
    PopupHelper.showCenterDialog("Data Error", "Format response tidak valid.");
  } catch (e) {
    operationField(massageError: e.toString());
  }
}

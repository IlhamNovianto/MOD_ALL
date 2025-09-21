import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:manager_on_duty/Service/api_endpoint.dart';
import 'package:manager_on_duty/Util/Popup/CekKoneksi.dart';
import 'package:manager_on_duty/Util/Popup/GagalFunction.dart';
import 'package:manager_on_duty/Util/helper/check_conection.dart';
import 'package:manager_on_duty/View/LoginView/Model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Service/UserPreference/user_preference.dart';
import '../../../Util/helper/createTicket.dart';
import '../PopUp/akunTidakDitemukan.dart';
import '../PopUp/berhasilMasuk.dart';

class LoginController extends GetxController {
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

//============== Mendapatkan Token =======================
  void getToken({String? userId, String? password}) async {
    isLoading(true);
    try {
      String connectionResult = await checkConnection();
      if (connectionResult.isEmpty) {
        popUpConnection();
        isLoading(false);
      } else {
        var headers = {'Content-Type': 'application/json'};
        var url = Uri.parse(connectionResult + ApiEndPoints.modLogin.getToken);
        final body = {"userId": userId, "password": password};
        http.Response response =
            await http.post(headers: headers, url, body: jsonEncode(body));
        if (response.statusCode == 200) {
          var tokenResponse = jsonDecode(response.body);
          if (tokenResponse['code'] == 200) {
            var res = TokenResponse.fromJson(tokenResponse);
            String token = res.data.first.token;
            await login(userId, password, token);
          } else {
            isLoading(false);
            //Popup Gagal mendapatkan Token
            popFieldGetToken(massageError: tokenResponse['message']);
          }
        } else {
          isLoading(false);
          popUpLoginField();
        }
      }
    } catch (error) {
      isLoading(false);
      operationField(massageError: error.toString());
    }
  }

//============== Login Dengan Token =======================
  Future<void> login(String? userId, String? password, String? token) async {
    try {
      String connectionResult = await checkConnection();
      if (connectionResult.isEmpty) {
        popUpConnection();
        isLoading(false);
      } else {
        var headersToken = {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        };
        final body = {"userId": userId, "password": password};
        var url = Uri.parse(connectionResult + ApiEndPoints.modLogin.login);
        http.Response response =
            await http.post(headers: headersToken, url, body: jsonEncode(body));

        if (response.statusCode == 200) {
          isLoading(false);
          final dataResponse = UserResponse.fromJson(jsonDecode(response.body));
          if (dataResponse.code == 200) {
            userIdController.clear();
            passwordController.clear();

            final getDetaiUser = dataResponse.data.first;
            //======================= Menyimpan Data preference Login ======================================

            if (getDetaiUser.peranan == 'General Manager') {
              createBm(userIdBm: getDetaiUser.userid);
            } else {
              SharedPreferences clearprefs =
                  await SharedPreferences.getInstance();
              clearprefs.remove('bmtiket');
            }
            saveUser(
                isloggedIn: true,
                saveToken: token,
                saveUserId: getDetaiUser.userid,
                savePasswd: getDetaiUser.passwd,
                saveEmail: getDetaiUser.email,
                saveName: getDetaiUser.name,
                savePeranan: getDetaiUser.peranan,
                saveDepartemen: getDetaiUser.departemen);
            popUpLoginSucessMaker(userId: userId); //PopUp

            Navigator.of(Get.context!).pop();
            // Get.offAll(const LandingPageMaker());
          } else {
            popUpLoginField();
          }
        }
      }
    } catch (error) {
      operationField(massageError: error.toString());
    }
  }
}

void createBm({String? userIdBm}) async {
  SharedPreferences getDataUser = await SharedPreferences.getInstance();
  String bmTiket = await createTicketBm(userId: userIdBm);
  await getDataUser.setString('bmtiket', bmTiket);
}

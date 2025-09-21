import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveBaseUrl(
    {required String nameBuilding,
    required String baseUrl,
    required String imgLogoBuilding,
    required String imgBackground}) async {
  SharedPreferences prefsUser = await SharedPreferences.getInstance();
  prefsUser.setString('baseurl', baseUrl);
  prefsUser.setString('buildingname', nameBuilding);
  prefsUser.setString('imglogo', imgLogoBuilding);
  prefsUser.setString('imgbackground', imgBackground);
}

Future<void> deleteBaseUrl() async {
  SharedPreferences prefsUser = await SharedPreferences.getInstance();
  prefsUser.remove('baseurl');
  prefsUser.remove('building');
  prefsUser.remove('imglogo');
  prefsUser.remove('imgbackground');
}

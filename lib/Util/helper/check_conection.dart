import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> checkConnection() async {
  SharedPreferences prefsUser = await SharedPreferences.getInstance();
  String baseUrl = prefsUser.getString('baseurl')!;
  try {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      return baseUrl; //Public
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return baseUrl;
      //return ApiEndPoints.baseUrlLocal; //Local
    } else if (connectivityResult == ConnectivityResult.none) {
      //popUpConnection();
      return ''; //Local
    } else {
      return '';
    }
  } catch (e) {
    //popUpConnection();
    return '';
  }
}

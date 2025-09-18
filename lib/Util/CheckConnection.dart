import 'package:connectivity_plus/connectivity_plus.dart';

import '../Service/Api_EndPoint.dart';

Future<String> checkConnection() async {
  try {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      print('Jaringan mobile ');
      return ApiEndPoints.baseUrlPublic; //Public
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('Jaringan wifi ');
      return ApiEndPoints.baseUrlPublic;
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

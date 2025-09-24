//Logout Function
import 'package:shared_preferences/shared_preferences.dart';

Future<void> logout({required String? userId}) async {
  SharedPreferences clearprefs = await SharedPreferences.getInstance();

  try {
    clearprefs.remove('bmtiket');
    clearprefs.clear();
    // removeTicket();
    // removeJobPref();
    // Get.offAll(const LoginPage());
  } catch (e) {
    print(e);
  }
}

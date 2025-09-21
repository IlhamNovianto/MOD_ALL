import 'package:shared_preferences/shared_preferences.dart';

saveUser(
    {required bool isloggedIn,
    String? saveToken,
    String? saveUserId,
    String? savePasswd,
    String? saveEmail,
    String? saveName,
    String? savePeranan,
    String? saveDepartemen}) async {
  SharedPreferences prefsUser = await SharedPreferences.getInstance();
  prefsUser.setBool('isLogin', isloggedIn);
  prefsUser.setString('token', saveToken!);
  prefsUser.setString("userid", saveUserId!);
  prefsUser.setString('password', savePasswd!);
  prefsUser.setString('email', saveEmail!);
  prefsUser.setString("username", saveName!);
  prefsUser.setString('peranan', savePeranan!);
  prefsUser.setString('departemen', saveDepartemen!);
}

removeUser() async {
  SharedPreferences prefsUser = await SharedPreferences.getInstance();
  prefsUser.remove('isLogin');
  prefsUser.remove('token');
  prefsUser.remove("userid");
  prefsUser.remove('password');
  prefsUser.remove('email');
  prefsUser.remove("username");
  prefsUser.remove('peranan');
  prefsUser.remove('departemen');
  prefsUser.remove('modTicket');
}

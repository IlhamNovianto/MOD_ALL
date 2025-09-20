import 'package:get/get.dart';
import 'package:manager_on_duty/Util/getVersion.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ChoseBuilding/PilihBuilding.dart';

class SplashScreenController extends GetxController {
  late SharedPreferences prefs;
  bool? isLogin;
  String? token;
  String? peranan;
  var baseUrl = ''.obs;
  String? eTicketJobs;
  var isLoading = false.obs;
  String? versionAPP;
  String? buildNumber;

  @override
  void onInit() async {
    // redirectPage();
    _getAppVersion();
    super.onInit();
  }

  // Function to get version and build number
  Future<void> _getAppVersion() async {
    // Get package info using package_info_plus
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    // Set state with app version and build number
    versionAPP = packageInfo.version; // Example: "1.0.0"
    buildNumber = packageInfo.buildNumber; // Example: "1"
    String idv = '$versionAPP+$buildNumber';
    await getVersionApps(versionAPP: idv);
  }

  void redirectPage() async {
    //SharedPreferences clearprefs = await SharedPreferences.getInstance();

    Future.delayed(const Duration(seconds: 3), () {
      Get.off(const Pilihbuilding());
      // Get.off(const LoginPage());
    });
  }
}

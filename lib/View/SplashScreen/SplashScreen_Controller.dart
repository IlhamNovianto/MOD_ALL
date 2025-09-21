import 'package:get/get.dart';
import 'package:manager_on_duty/Config/Pilih%20Build/dataBuild.dart';
import 'package:manager_on_duty/Util/helper/getVersion.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // 🟢 ini untuk simpan argument dari PilihBuildingController
  late LocationItem login;

  @override
  void onInit() async {
    // ambil argument dari route
    login = Get.arguments as LocationItem;

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
    prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool('isLogin') ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed('/login', arguments: login);
      // if (isLogin == true) {
      //   // Get.offAllNamed('/home', arguments: login);
      // } else {
      //   // User belum login, redirect ke LoginPage
      //   Get.offAllNamed('/login', arguments: login);
      // }
    });
  }
}

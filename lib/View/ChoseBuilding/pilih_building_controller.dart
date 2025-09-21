import 'package:get/get.dart';
import 'package:manager_on_duty/Service/UserPreference/chosed_building.dart';

import '../../Config/Pilih Build/dataBuild.dart';

class PilihBuildingController extends GetxController {
  var selectedBuilding = Rxn<LocationItem>(); // bisa null awalnya
  // String? nameBuilding;
  // String? baseUrl;
  // String? imgLogoBuilding;
  // String? imgBackground;
  Future<void> chooseBuilding(LocationItem value) async {
    selectedBuilding.value = value;

    // nameBuilding = value.name;
    // baseUrl = value.baseUrl;
    // imgLogoBuilding = value.imgLogoBuilding;
    // imgBackground = value.imgBackground;

    // simpan ke SharedPreferences
    await saveBaseUrl(
      nameBuilding: value.name,
      baseUrl: value.baseUrl,
      imgLogoBuilding: value.imgLogoBuilding,
      imgBackground: value.imgBackground,
    );

    // print(value.name);
    // print(value.baseUrl);
    // print(value.imgBackground);
    // print(value.imgLogoBuilding);

    Get.toNamed('/splash', arguments: selectedBuilding.value);
  }
}

import 'package:get/get.dart';
import 'package:manager_on_duty/Service/UserPreference/save_chosed_building.dart';

import '../../Config/Pilih Build/dataBuild.dart';

class PilihBuildingController extends GetxController {
  var selectedBuilding = Rxn<LocationItem>();

  Future<void> chooseBuilding(LocationItem value) async {
    selectedBuilding.value = value;

    await saveBaseUrl(
      nameBuilding: value.name,
      baseUrl: value.baseUrl,
      imgLogoBuilding: value.imgLogoBuilding,
      imgBackground: value.imgBackground,
    );
    Get.toNamed('/splash', arguments: selectedBuilding.value);
  }
}

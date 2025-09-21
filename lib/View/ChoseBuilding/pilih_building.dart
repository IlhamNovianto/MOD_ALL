import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager_on_duty/Config/Pilih%20Build/dataBuild.dart';

import 'pilih_building_controller.dart';

class Pilihbuilding extends StatefulWidget {
  const Pilihbuilding({super.key});

  @override
  State<Pilihbuilding> createState() => _PilihbuildingState();
}

class _PilihbuildingState extends State<Pilihbuilding> {
  final controller = Get.put(PilihBuildingController());
  LocationItem? selectedValue; // nilai yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Pilih Lokasi MOD : '),
          Center(
              child: DropdownButton<LocationItem>(
            hint: const Text("Pilih Lokasi"),
            value: selectedValue,
            items: LocationData.locations.map((location) {
              return DropdownMenuItem(
                value: location,
                child: Text(location.name),
              );
            }).toList(),
            onChanged: (value) async {
              if (value != null) {
                controller.chooseBuilding(value);
              }
              // setState(() {
              //   selectedValue = value;
              // });
              // controller.chooseBuilding(value);
              // // await saveBaseUrl(
              // //     nameBuilding: '${value?.name}', baseUrl: '${value?.baseUrl}');
            },
          )),
        ],
      ),
    );
  }
}

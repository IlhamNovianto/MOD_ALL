import 'package:flutter/material.dart';
import 'package:manager_on_duty/Util/Pilih%20Build/dataBuild.dart';

class Pilihbuilding extends StatefulWidget {
  const Pilihbuilding({super.key});

  @override
  State<Pilihbuilding> createState() => _PilihbuildingState();
}

class _PilihbuildingState extends State<Pilihbuilding> {
  String? selectedValue; // nilai yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pilih Lokasi")),
      body: Center(
        child: DropdownButton<String>(
          hint: const Text("Pilih Lokasi"),
          value: selectedValue,
          items: LocationData.locations.map((location) {
            return DropdownMenuItem(
              value: location,
              child: Text(location),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
        ),
      ),
    );
  }
}

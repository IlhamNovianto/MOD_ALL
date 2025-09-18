import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> popUpConnection() async {
  showDialog(
      context: Get.context!,
      builder: (context) {
        return const SimpleDialog(
          title: Icon(
            Icons.signal_cellular_connected_no_internet_0_bar_outlined,
            color: Color.fromARGB(255, 255, 30, 0),
            size: 50,
          ),
          contentPadding: EdgeInsets.all(20),
          children: [
            Center(
              child: Text(
                "Tidak ada koneksi",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Text(
              "Mohon Hubungkan Koneksi Internet",
              textAlign: TextAlign.center,
            ),
          ],
        );
      });
}

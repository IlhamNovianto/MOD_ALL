//Gagal menjalankakn fungsi
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void operationField({String? massageError}) async {
  showDialog(
      context: Get.context!,
      builder: (context) {
        return SimpleDialog(
          title: Image.asset(
            'images/icon_error.png',
            width: 50,
            height: 50,
          ),
          contentPadding: const EdgeInsets.all(20),
          children: [
            const Center(
              child: Text(
                "Ada Kesalahan teknis pada Controller",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Text(
              "Permasalahan : $massageError",
              textAlign: TextAlign.center,
            )
          ],
        );
      });
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void warningOut({required String title, required String massage}) async {
  showDialog(
      context: Get.context!,
      builder: (context) {
        return SimpleDialog(
          title: Image.asset(
            'images/icon_warning.png',
            width: 50,
            height: 50,
          ),
          contentPadding: const EdgeInsets.all(20),
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Center(
              child: Text(
                massage,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('OK'),
              onPressed: () {
                exit(0);
              },
            ),
          ],
        );
      });
}

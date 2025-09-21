import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupHelper {
  static void showCenterDialog(String title, String message,
      {VoidCallback? onConfirm}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Text(message, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Get.back(); // tutup popup
                  if (onConfirm != null) onConfirm();
                },
                child: const Text("OK"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

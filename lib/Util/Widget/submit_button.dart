import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubmitButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  bool isEnabled;

  SubmitButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 150,
        height: 50,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
              color: Colors.white.withOpacity(0.25),
              offset: const Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 1)
        ]),
        child: ElevatedButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide.none)),
              backgroundColor: WidgetStateProperty.all<Color>(
                isEnabled
                    ? Colors.blue[400]! // Warna aktif
                    : const Color.fromARGB(122, 66, 164, 245), // Warna nonaktif
              ),
            ),
            onPressed: isEnabled ? onPressed : null,
            child: Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ))),
      ),
    );
  }
}

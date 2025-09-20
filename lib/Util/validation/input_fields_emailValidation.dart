// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputTextFieldWidgetEmail extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;

  const InputTextFieldWidgetEmail(this.textEditingController, this.hintText,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: validateEmail,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: textEditingController,
        decoration: InputDecoration(
            labelText: hintText,
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            fillColor: Colors.white54,
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.all(8.0),
            focusColor: Colors.white60),
      ),
    );
  }
}

String? validateEmail(String? value) {
  if (GetUtils.isEmail(value!) || value.isEmpty) {
    return null;
  } else {
    return 'Masukan email valid';
  }
}

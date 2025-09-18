// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputTextFieldWidgetNotNull extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;

  InputTextFieldWidgetNotNull(this.textEditingController, this.hintText);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      validator: validateNotNull,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      decoration: InputDecoration(
          labelText: hintText,
          //hintStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent)),
          fillColor: Colors.white,
          hintStyle: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
          contentPadding: EdgeInsets.all(8.0),
          focusColor: Color.fromARGB(255, 255, 255, 255)),
    ));
  }
}

String? validateNotNull(String? value) {
  if (value == null || value.isEmpty) {
    return "Form Tidak Boleh Kosong";
  }
  return null;
}

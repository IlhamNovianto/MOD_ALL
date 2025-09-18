// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class InputTextFieldWidgetPassword extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;

  const InputTextFieldWidgetPassword({
    Key? key,
    required this.textEditingController,
    required this.hintText,
  }) : super(key: key);

  @override
  State<InputTextFieldWidgetPassword> createState() =>
      _InputTextFieldWidgetPasswordState();
}

class _InputTextFieldWidgetPasswordState
    extends State<InputTextFieldWidgetPassword> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        obscureText: _isObscured,
        validator: validatePassword,
        controller: widget.textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            labelText: widget.hintText,
            labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            suffixIcon: IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            ),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent)),
            fillColor: Colors.white,
            hintStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.all(8.0),
            focusColor: Colors.white),
      ),
    );
  }
}

String? validatePassword(String? value) {
  if (!GetUtils.isLengthLessOrEqual(value, 5)) {
    return null;
  }
  return "Minimal 6 karakter";
}

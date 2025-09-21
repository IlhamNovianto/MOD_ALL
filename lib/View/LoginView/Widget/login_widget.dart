import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manager_on_duty/Util/Widget/submit_button.dart';

import '../../../Util/validation/input_fields_notNull.dart';
import '../../../Util/validation/input_fields_passwordValidation.dart';
import '../Controller/login_controller.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  LoginController loginController = Get.put(LoginController());
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    loginController.userIdController.addListener(_checkFields);
    loginController.passwordController.addListener(_checkFields);
  }

  void _checkFields() {
    setState(() {
      isButtonEnabled = loginController.userIdController.text != "" &&
          loginController.passwordController.text.length >= 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Login',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        //================= Inputan Username ===================================
        Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(112, 255, 255, 255),
                borderRadius: BorderRadius.circular(10)),
            child: InputTextFieldWidgetNotNull(
                loginController.userIdController, 'User ID')),
        const SizedBox(
          height: 20,
        ),
        //================= Inputan Password ===================================
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(112, 255, 255, 255),
              borderRadius: BorderRadius.circular(10)),
          child: InputTextFieldWidgetPassword(
              textEditingController: loginController.passwordController,
              hintText: 'Password'),
        ),
        const SizedBox(
          height: 40,
        ),
        //===================== Button Login ===================================
        Center(
            child: Obx(
          () => loginController.isLoading.value
              ? const CircularProgressIndicator()
              : SubmitButton(
                  onPressed: isButtonEnabled
                      ? () {
                          String userId = loginController.userIdController.text;
                          String password =
                              loginController.passwordController.text;

                          // Menghilangkan fokus dari TextField
                          // FocusScope.of(context).unfocus();

                          // Lakukan aksi login
                          loginController.getToken(
                              userId: userId, password: password);
                        }
                      : null,
                  title: 'Login',
                  isEnabled: isButtonEnabled,
                ),
        )),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

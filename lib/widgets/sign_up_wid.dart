import 'package:flutter/material.dart';
import 'package:my_travaly_demo/constant/general_const.dart';
import 'package:my_travaly_demo/controller/login_and_sign_up_controller.dart';
import 'package:my_travaly_demo/utils/utils_theme_fonts.dart';

Widget signUpWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: LoginAndSignUpController.to.emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          validator: (value) {
            return LoginAndSignUpController.to.validateEmail(value);
          },
          decoration: InputDecoration(
            // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.red, width: 1.0)),
            hintText: "Enter your email",
            label: Text("Email"),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
          controller: LoginAndSignUpController.to.passwordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          validator: (value) {
            return LoginAndSignUpController.to.validatePassword(value);
          },
          decoration: InputDecoration(
            label: Text("Password"),
            hintText: "Enter your password",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
      SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: ElevatedButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();

              if (LoginAndSignUpController.to.formKey.currentState != null && LoginAndSignUpController.to.formKey.currentState!.validate()) {
                LoginAndSignUpController.to.signUpWithEmailAndPassword();
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent, minimumSize: Size(200, 50)),
            child: Text(signup, style: ThemeFonts.bold(20).copyWith(color: Colors.black))),
      )
    ],
  );
}

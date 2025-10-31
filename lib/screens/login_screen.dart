import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_travaly_demo/constant/general_const.dart';
import 'package:my_travaly_demo/controller/login_and_sign_up_controller.dart';
import 'package:my_travaly_demo/utils/utils_theme_fonts.dart';
import 'package:my_travaly_demo/widgets/login_wid.dart';
import 'package:my_travaly_demo/widgets/sign_up_wid.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(20),
              height: Get.height * 0.6,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)]),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text(LoginAndSignUpController.to.isSelected[0] ? login : signup, style: ThemeFonts.bold(20).copyWith(color: Colors.black)),
                    ),
                    ToggleButtons(
                      isSelected: LoginAndSignUpController.to.isSelected,
                      onPressed: (index) {
                        LoginAndSignUpController.to.changetheType(index);
                      },
                      constraints: const BoxConstraints(minHeight: 60.0, minWidth: 120.0),
                      disabledColor: Colors.blueGrey,
                      textStyle: ThemeFonts.bold2(18, Colors.white),
                      disabledBorderColor: Colors.blueGrey,
                      fillColor: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                      children: LoginAndSignUpController.to.signType,
                    ),
                    Form(
                        key: LoginAndSignUpController.to.formKey,
                        child: LoginAndSignUpController.to.isSelected[0] ? loginInWidget() : signUpWidget()),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

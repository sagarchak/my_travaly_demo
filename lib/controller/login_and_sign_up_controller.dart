import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:my_travaly_demo/constant/general_const.dart';

import 'package:my_travaly_demo/screens/home_screen.dart';
import 'package:my_travaly_demo/utils/utils_general.dart';

class LoginAndSignUpController extends GetxController {
  static LoginAndSignUpController get to => Get.find();

  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  RxList<bool> isSelected = [true, false].obs;

  RxList<Text> signType = [
    Text(
      login,
    ),
    Text(
      signup,
    ),
  ].obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  changetheType(int index) {
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    formKey.currentState?.reset();
    FocusManager.instance.primaryFocus?.unfocus();
    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
      if (buttonIndex == index) {
        isSelected[buttonIndex] = true;
      } else {
        isSelected[buttonIndex] = false;
      }
    }
  }

//Firebase Sign Up with Email and Password
  signUpWithEmailAndPassword() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password).then((UserCredential userCredential) {
        // Sign-up successful
        snackbarMessage(title: signup, message: "$signup Successful");
      }).catchError((error) {
        // Handle sign-up error
        snackbarMessage(title: signup, message: error.toString());
      });
    } catch (e) {
      snackbarMessage(title: signup, message: e.toString());
    }
  }

  /* validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your name";
    } else if (value.length < 3) {
      return "Name must be at least 3 characters long";
    }
  }*/

  validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters long";
    } else {
      return null;
    }
  }

  //Firebase Login with Email and Password
  signInWithEmailAndPassword() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      auth.signInWithEmailAndPassword(email: email, password: password).then((UserCredential userCredential) {
        snackbarMessage(title: login, message: "$login Successful");
        Get.to(Home());
      }).catchError((error) {
        snackbarMessage(title: login, message: error.toString());
        // Handle login error
      });
    } catch (e) {
      snackbarMessage(title: login, message: e.toString());
    }
  }

  validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
      return "Please enter your email";
    } else {
      return null;
    }
  }

//Firebase Sign In with Google
  signInWithGoogle() async {
    try {
      final user = await GoogleSignIn().signIn();
      GoogleSignInAuthentication userAuth = await user!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: userAuth.accessToken,
        idToken: userAuth.idToken,
      );
      await auth.signInWithCredential(credential).then((UserCredential userCredential) {
        snackbarMessage(title: login, message: "$login Successful");
        Get.to(Home());
      }).catchError((error) {
        snackbarMessage(title: login, message: error.toString());
        // Handle Google Sign-In error
      });
    } catch (e) {
      snackbarMessage(title: login, message: e.toString());
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype_02_app/src/pages/launch/launch_init.dart';
import 'package:prototype_02_app/src/repository/login_api.dart';

class LaunchSignUpController extends GetxController {
  LoginApi loginApi = LoginApi();
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  emailSignUp() async {
    try {
      print(emailController.text);
      await loginApi.emailAccountReg(
          emailController.text, passwordController.text);
      return Get.offAll(LaunchInit());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Get.snackbar('오류', '비밀번호는 특수문자를 포함 해 주세요.');
      } else if (e.code == 'email-already-in-use') {
        return Get.snackbar('오류', '사용중인 이메일입니다.');
      }
    }
  }
}

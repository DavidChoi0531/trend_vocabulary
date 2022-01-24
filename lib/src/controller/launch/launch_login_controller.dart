import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:prototype_02_app/src/controller/launch/launch_init_controller.dart';
import 'package:prototype_02_app/src/repository/login_api.dart';

class LaunchLoginController extends GetxController {
  LoginApi loginApi = LoginApi();
  var loginFormKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  emailLogin() async {
    try {
      print(emailController.text);
      await loginApi.emailSignIn(emailController.text, passwordController.text);
      Get.offAllNamed('/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Get.snackbar('오류', '사용자를 찾을 수 없습니다.');
      } else if (e.code == 'wrong-password') {
        return Get.snackbar('오류', '잘못된 비밀번호 입니다.');
      }
    }
  }

  googleLogin() async {
    try {
      await loginApi.googleSignIn();
      String token = await FirebaseAuth.instance.currentUser!.getIdToken();
      return true;
    } catch (e) {
      return false;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:prototype_02_app/src/controller/launch/launch_login_controller.dart';
import 'package:prototype_02_app/src/controller/launch/launch_sign_up_controller.dart';
import 'package:prototype_02_app/src/pages/launch/launch_init.dart';
import 'package:prototype_02_app/src/pages/launch/launch_screen_login.dart';

class LaunchScreenSignUp extends StatelessWidget {
  LaunchScreenSignUp({Key? key}) : super(key: key);

  LaunchSignUpController controller = LaunchSignUpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/src/assets/img/backgroundImg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '회원가입',
                  style: TextStyle(
                      fontFamily: 'notosans',
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
                ),
                _buildSignIn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignIn() {
    return Container(
      width: Get.width - 50,
      height: 280,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            Container(
              width: Get.width - 115,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.email_outlined,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'example@example.co.kr',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: Get.width - 115,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.vpn_key_outlined,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: controller.passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Input your password',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                await controller.emailSignUp();
              },
              child: Container(
                width: Get.width - 115,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: Get.width - 115,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:prototype_02_app/src/controller/launch/launch_login_controller.dart';
import 'package:prototype_02_app/src/pages/launch/launch_init.dart';
import 'package:prototype_02_app/src/pages/launch/launch_screen_sign_up.dart';

class LaunchScreenLogin extends GetView<LaunchLoginController> {
  const LaunchScreenLogin({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildLogin(),
                const SizedBox(
                  height: 50,
                ),
                _buildSnsLogin(),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogin() {
    return Container(
      width: Get.width - 50,
      height: 270,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            Text(
              '로그인',
              style: TextStyle(
                fontFamily: 'notosans',
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
                await controller.emailLogin();
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
                    'Login',
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

  Widget _buildSnsLogin() {
    return Container(
      width: Get.width - 50,
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
              onTap: () {
                Get.to(LaunchScreenSignUp());
              },
              child:
                  Image.asset('lib/src/assets/img/signin/email_sign_in.png')),
          const SizedBox(height: 10),
          Image.asset('lib/src/assets/img/signin/apple_sign_in.png'),
          const SizedBox(height: 10),
          GestureDetector(
              onTap: () async {
                var result = await controller.googleLogin();
                if (result) {
                  Get.offAll(LaunchInit());
                }
              },
              child:
                  Image.asset('lib/src/assets/img/signin/google_sign_in.png')),
        ],
      ),
    );
  }
}

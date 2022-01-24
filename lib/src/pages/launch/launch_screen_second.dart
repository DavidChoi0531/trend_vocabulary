import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype_02_app/src/controller/launch/launch_screen_controller.dart';
import 'package:prototype_02_app/src/pages/launch/launch_screen_login.dart';

class LaunchScreenSecond extends GetView<LaunchScreenController> {
  const LaunchScreenSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              // SizedBox(
              //   height: 200,
              // ),
              _buildContent(),
              const SizedBox(
                height: 70,
              ),
              _buildButton(),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildContent() {
    return Container(
      width: Get.width - 100,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: const Text(
        '출근길, 퇴근길\n잠깐의 시간을 통해\n단어를 익히고\n유능한 전문가로 거듭나세요.',
        style: TextStyle(
          fontFamily: 'notosans',
          fontSize: 25,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0,
          color: Color(0xffBDBDBD),
        ),
      ),
    );
  }

  _buildButton() {
    return GestureDetector(
      onTap: () {
        Get.to(LaunchScreenLogin());
      },
      child: Container(
        width: Get.width - 150,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(33),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: controller.visible_first.value ? 1.0 : 0.0,
                child: const Text(
                  '시작하기',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'notosans',
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Obx(
              () => AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: controller.visible_second.value ? 1.0 : 0.0,
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Icon(
                    Icons.navigate_next,
                    size: 23,
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

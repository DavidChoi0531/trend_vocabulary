import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype_02_app/src/controller/launch/launch_screen_controller.dart';
import 'package:prototype_02_app/src/pages/launch/launch_screen_second.dart';

class LaunchScreenFirst extends GetView<LaunchScreenController> {
  const LaunchScreenFirst({Key? key}) : super(key: key);

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
        '단어의 뜻을 알지 못해\n답답하셨나요?\n영어로 된 검색결과를\n무슨 뜻인지 몰라\n헤메고 계신가요?',
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
        Get.to(LaunchScreenSecond());
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
                  '다음',
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

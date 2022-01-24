import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype_02_app/src/components/todays_voca.dart';
import 'package:prototype_02_app/src/controller/main/home_screen_controller.dart';
import 'package:prototype_02_app/src/pages/main/learning_list_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isInitialized.value) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  _buildTodaysVocaTitle(),
                  const SizedBox(
                    height: 10,
                  ),
                  TodaysVoca(
                    // keyword: controller.todaysWord.value,
                    keyword: controller.todaysWord,
                  ),
                  _buildHomeList(),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildTodaysVocaTitle() {
    return Row(
      children: [
        const SizedBox(
          width: 70,
        ),
        Text(
          controller.title,
          style: const TextStyle(
            fontFamily: 'notosans',
            fontWeight: FontWeight.w700,
            fontSize: 25,
            shadows: [
              Shadow(
                blurRadius: 5.0,
                color: Colors.grey,
                offset: const Offset(1.0, 1.0),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildListButton(String title) {
    return Container(
      width: Get.width - 100,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(33.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            offset: Offset(2.0, 2.0),
            color: Colors.grey,
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'notosans',
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildHomeList() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          _buildListButton('분야별 단어'),
          const SizedBox(
            height: 7,
          ),
          GestureDetector(
              onTap: () {
                Get.to(
                  LearningListScreen(),
                );
              },
              child: _buildListButton('나의 학습 목록')),
          const SizedBox(
            height: 7,
          ),
          _buildListButton('etc')
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype_02_app/src/controller/main/profile_screen_controller.dart';
import 'package:prototype_02_app/src/pages/launch/launch_init.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  ProfileScreenController controller = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const SizedBox(
            height: 30,
          ),
          _buildProfile(),
          _buildProfileList(),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 220,
        width: Get.width - 100,
        child: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 70,
                backgroundImage:
                    AssetImage('lib/src/assets/img/default_profile.png'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => Text(
                controller.userId.value,
                style: const TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileList() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 400,
        width: Get.width - 50,
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              onTap: () {},
              title: const Text(
                '나의 정보',
                style: TextStyle(
                    fontFamily: 'notosans',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              onTap: () {},
              title: const Text(
                '알림 설정',
                style: TextStyle(
                    fontFamily: 'notosans',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              onTap: () {
                controller.signOut();
                Get.offAll(LaunchInit());
              },
              title: const Text(
                '로그아웃',
                style: TextStyle(
                    fontFamily: 'notosans',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              onTap: () {
                controller.deleteAllLearningList();
              },
              title: const Text(
                '데이터 삭제',
                style: TextStyle(
                    fontFamily: 'notosans',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
    );
  }
}

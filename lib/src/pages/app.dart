import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:prototype_02_app/src/controller/app_controller.dart';

import 'package:prototype_02_app/src/pages/main/home_screen.dart';
import 'package:prototype_02_app/src/pages/main/profile_screen.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isInitialized.value) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 0,
          ),
          body: Obx(() {
            switch (RouteName.values[controller.currentIndex.value]) {
              case RouteName.home:
                return HomeScreen();
              case RouteName.profile:
                return ProfileScreen();
            }
          }),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                  ),
                  label: 'Profile',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentIndex.value,
              onTap: controller.changePageIndex,
            ),
          ),
        );
      } else {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype_02_app/src/controller/launch/launch_init_controller.dart';
import 'package:prototype_02_app/src/pages/app.dart';
import 'package:prototype_02_app/src/pages/launch/launch_screen_first.dart';

class LaunchInit extends StatelessWidget {
  LaunchInit({Key? key}) : super(key: key);

  LaunchInitController controller = Get.put(LaunchInitController());

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return App();
    } else {
      return LaunchScreenFirst();
    }
  }
}

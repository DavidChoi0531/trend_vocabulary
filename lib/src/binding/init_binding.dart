import 'dart:math';

import 'package:get/instance_manager.dart';
import 'package:prototype_02_app/src/controller/app_controller.dart';
import 'package:prototype_02_app/src/controller/components/todays_voca_controller.dart';
import 'package:prototype_02_app/src/controller/launch/launch_login_controller.dart';
import 'package:prototype_02_app/src/controller/launch/launch_screen_controller.dart';
import 'package:prototype_02_app/src/controller/main/home_screen_controller.dart';
import 'package:prototype_02_app/src/repository/word_api.dart';

class InitBinding implements Bindings {
  WordApi wordApi = WordApi();
  @override
  void dependencies() async {
    Get.put(AppController());
    Get.put(LaunchScreenController());
    Get.put(LaunchLoginController());
  }
}

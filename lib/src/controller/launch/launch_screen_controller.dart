import 'dart:async';
import 'dart:io';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class LaunchScreenController extends GetxController {
  late Timer timer_first;
  late Timer timer_second;
  RxBool visible_first = false.obs;
  RxBool visible_second = false.obs;

  @override
  onInit() {
    super.onInit();
    timer_first = Timer.periodic(
        const Duration(milliseconds: 2000), (timer) => visibleFirst());
    timer_second = Timer.periodic(
        const Duration(milliseconds: 2000), (timer) => visibleSecond());
  }

  @override
  onClose() {
    timer_first.cancel();
    timer_second.cancel();
    super.onClose();
  }

  visibleFirst() {
    visible_first.value = !visible_first.value;
  }

  visibleSecond() async {
    await Future.delayed(const Duration(milliseconds: 300));
    visible_second.value = !visible_second.value;
  }
}

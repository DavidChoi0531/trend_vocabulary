import 'dart:math';

import 'package:drift/drift.dart' as dr;
import 'package:get/state_manager.dart';
import 'package:prototype_02_app/src/controller/app_controller.dart';
import 'package:prototype_02_app/src/data/learning_list/learning_list.dart';
import 'package:prototype_02_app/src/repository/word_api.dart';

class HomeScreenController extends GetxController {
  String title = '오늘의 단어';
  RxBool isInitialized = false.obs;
  String todaysWord = AppController.to.todaysWord;
  DateTime today = AppController.to.today;

  @override
  void onInit() async {
    await insertToLearningList();
  }

  insertToLearningList() async {
    if (AppController.to.changeData) {
      var learningListDatabase = AppController.to.learningListDatabase;
      var result = await learningListDatabase
          .addLearningList(LearningListCompanion(word: dr.Value(todaysWord)));
    }
    isInitialized(true);
  }
}

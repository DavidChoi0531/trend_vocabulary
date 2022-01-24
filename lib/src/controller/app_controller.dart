import 'dart:math';

import 'package:drift/drift.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:prototype_02_app/src/data/app_init_db.dart/init_db.dart';
import 'package:prototype_02_app/src/data/learning_list/learning_list.dart';
import 'package:prototype_02_app/src/repository/word_api.dart';

enum RouteName { home, profile }

class AppController extends GetxController {
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;
  late DateTime today = DateTime.utc(2022, 1, 20);
  late String todaysWord;
  bool changeData = false;
  RxBool isInitialized = false.obs;
  InitDBDatabase initDBDatabase = InitDBDatabase();
  LearningListDatabase learningListDatabase = LearningListDatabase();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initAppContent();
  }

  void changePageIndex(int index) {
    currentIndex(index);
  }

  initAppContent() async {
    try {
      var response = await initDBDatabase.allInitEntries;
      if (response.today.day == DateTime.now().day) {
        todaysWord = response.todaysWord;
        today = DateTime.now();
        print('같은날');
        print(response.today.day);
        print(todaysWord);
      } else {
        WordApi api = WordApi();
        String word =
            await api.getWordById((Random().nextInt(2684) + 1).toString());
        initDBDatabase.updateInit(InitDBCompanion(
            today: Value(DateTime.now()), todaysWord: Value(word)));
        today = DateTime.now();
        todaysWord = word;
        print('다른날');
        changeData = true;
      }
    } catch (e) {
      WordApi api = WordApi();
      String word =
          await api.getWordById((Random().nextInt(2684) + 1).toString());
      initDBDatabase.addInit(InitDBCompanion(
          today: Value(DateTime.now()), todaysWord: Value(word)));
      today = DateTime.now();
      todaysWord = word;
      changeData = true;
    }
    isInitialized(true);
  }
}

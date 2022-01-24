import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:prototype_02_app/src/controller/app_controller.dart';
import 'package:prototype_02_app/src/data/learning_list/learning_list.dart';
import 'package:prototype_02_app/src/models/word.dart';

class LearningListScreenController extends GetxController {
  Future<List<Word>> getList() async {
    var learningListDatabase = AppController.to.learningListDatabase;
    var response = await learningListDatabase.allLearningListEntries;
    List<Word> result = <Word>[];
    for (var element in response) {
      print(element.toString());
      result.add(Word(id: element.id, text: element.word));
    }
    print(result);
    return result;
  }
}

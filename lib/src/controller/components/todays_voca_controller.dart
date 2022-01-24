import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:prototype_02_app/src/models/vocabulary.dart';
import 'package:prototype_02_app/src/repository/dic_api.dart';

class TodaysVocaController extends GetxController {
  DicAPI dicAPI = DicAPI();
  String searchWord;
  Rx<Vocabulary> voca =
      Vocabulary(word: 'word', description: 'description').obs;

  TodaysVocaController({required this.searchWord});

  @override
  onInit() async {
    super.onInit();
    await getVoca();
  }

  getVoca() async {
    var response = await dicAPI.dicCrawling(searchWord);
    // var response = await dicAPI.wikiCrawling(searchWord);
    voca(Vocabulary.fromJson(response));
  }

  String get word => voca.value.word;
  String get description => voca.value.description;
  String get wikiUrl {
    var searchStr = Uri.encodeFull(word);
    // print(searchStr);
    return 'https://ko.wikipedia.org/wiki/$searchStr';
  }
  // String get youtubeUrl => 'https://www.youtube.com/results?search_query=$word';

  String get youtubeUrl {
    var searchStr = Uri.encodeFull(word);
    // print(searchStr);
    return 'https://www.youtube.com/results?search_query=$searchStr';
  }

  String get newsUrl {
    var searchStr = Uri.encodeFull(word);
    // print(searchStr);
    return 'https://search.naver.com/search.naver?where=news&ie=utf8&query=$searchStr';
  }
}

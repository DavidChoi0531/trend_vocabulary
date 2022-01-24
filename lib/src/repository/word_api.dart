import 'package:dio/dio.dart';
import 'package:prototype_02_app/src/models/word.dart';

class WordApi {
  Dio dio = Dio();

  getWordById(String id) async {
    String url = "http://52.79.227.126:8080/word/$id";
    var response = await dio.get(url);
    var data = Word.fromjson(response.data[0]);
    print(data.text);
    return data.text;
  }
}

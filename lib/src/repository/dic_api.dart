import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;
import 'package:prototype_02_app/src/controller/app_controller.dart';
import 'package:prototype_02_app/src/controller/components/todays_voca_controller.dart';

class DicAPI {
  Dio dio = Dio();

  dicCrawling(String search) async {
    // print(search);
    String encodingText = Uri.encodeFull(search);
    // print(encodingText);
    Map<String, dynamic> result = {
      'word': 'word',
      'desc': 'desc',
    };
    String url =
        "https://dic.daum.net/search.do?q=$encodingText&dic=eng&search_first=Y";
    var response = await dio.get(url);
    Document document = parser.parse(response.data);
    var elementWord = document.getElementsByClassName('tit_cleansch');
    var elementDesc = document.getElementsByClassName('list_search');
    print(elementWord);
    print(elementDesc);
    String wordStr = '';
    String descStr = '';
    if (elementDesc.isEmpty || elementWord.isEmpty) {
      return wikiCrawling(search);
    }

    if (elementDesc.isNotEmpty && elementWord.isNotEmpty) {
      for (var element in elementWord) {
        wordStr = wordStr + element.text;
      }
      elementDesc[0].getElementsByClassName('txt_search').forEach((element) {
        descStr = descStr + element.text + ', ';
      });
      wordStr = wordStr.trim();
      descStr = descStr.substring(0, descStr.length - 2);
      result['word'] = wordStr;
      result['desc'] = descStr;
    }
    print(result);
    return result;
  }

  wikiCrawling(String search) async {
    String encodingText = Uri.encodeFull(search);
    // print(encodingText);
    Map<String, dynamic> result = {
      'word': 'word',
      'desc': 'desc',
    };

    String url = "https://ko.wikipedia.org/wiki/$search";
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      // print(response.data);
      Document document = parser.parse(response.data);
      var elementWord = document.getElementById('firstHeading');
      var elementDesc = document.getElementsByClassName('mw-parser-output');

      String wordStr = '';
      String descStr = '';

      // print(elementWord);
      // print(elementDesc);

      if (elementDesc.isNotEmpty) {
        wordStr = wordStr + elementWord!.text;
        // print(elementDesc[0].getElementsByTagName('p'));

        descStr = elementDesc[0].getElementsByTagName('p')[0].text;
        wordStr = wordStr.trim();
        // descStr = descStr.substring(0, descStr.length - 2);
        result['word'] = wordStr;
        result['desc'] = descStr;
      }
      // print(result);
      return result;
    } else {
      return result;
    }
  }
}

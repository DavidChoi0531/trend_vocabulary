import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype_02_app/src/controller/app_controller.dart';
import 'package:prototype_02_app/src/controller/components/todays_voca_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KeywordWebView extends StatelessWidget {
  KeywordWebView({Key? key, required this.url}) : super(key: key);

  final String url;
  late WebViewController _controller;
  late TodaysVocaController _controller2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: Get.height - 130,
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              backgroundColor: Colors.white,
              onWebViewCreated: (WebViewController controller) {
                _controller = controller;
              },
              initialUrl: url,
              allowsInlineMediaPlayback: true,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  _controller.goBack();
                },
                icon: const Icon(Icons.navigate_before),
                iconSize: 40,
              ),
              IconButton(
                onPressed: () {
                  _controller.goForward();
                },
                icon: const Icon(Icons.navigate_next),
                iconSize: 40,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.clear),
                iconSize: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

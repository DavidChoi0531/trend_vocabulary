import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype_02_app/src/components/keyword_web_view.dart';
import 'package:prototype_02_app/src/controller/components/todays_voca_controller.dart';

class TodaysVoca extends StatefulWidget {
  const TodaysVoca({Key? key, required this.keyword}) : super(key: key);

  final String keyword;

  @override
  State<TodaysVoca> createState() => _TodaysVocaState();
}

class _TodaysVocaState extends State<TodaysVoca> {
  late final TodaysVocaController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(TodaysVocaController(searchWord: widget.keyword));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTodaysVoca(),
        Divider(
          height: 40,
          thickness: 1,
          indent: 50,
          endIndent: 50,
          color: Colors.grey.withOpacity(0.5),
        ),
        _buildListButton(),
        Divider(
          height: 40,
          thickness: 1,
          indent: 50,
          endIndent: 50,
          color: Colors.grey.withOpacity(0.5),
        ),
      ],
    );
  }

  Widget _buildTodaysVoca() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: Get.width - 100,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.cyan[100],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 5.0,
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(5.0, 5.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            _vocabulary(),
            const SizedBox(
              height: 10,
            ),
            _description(),
          ],
        ),
      ),
    );
  }

  Widget _vocabulary() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          controller.word,
          style: const TextStyle(
            fontFamily: 'roboto',
            fontWeight: FontWeight.w500,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget _description() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          controller.description,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          softWrap: false,
          style: const TextStyle(
              fontFamily: 'roboto', fontSize: 20, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }

  Widget _buildListButton() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: Get.width - 80,
        height: 75,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => KeywordWebView(url: controller.wikiUrl),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 500),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 75,
                        width: 75,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(2.0, 2.0),
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'lib/src/assets/img/wiki.png',
                          height: 55,
                          width: 55,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => KeywordWebView(url: controller.youtubeUrl),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 500),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(2.0, 2.0),
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'lib/src/assets/img/youtube.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => KeywordWebView(url: controller.newsUrl));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        height: 75,
                        width: 75,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(2.0, 2.0),
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'lib/src/assets/img/naver.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

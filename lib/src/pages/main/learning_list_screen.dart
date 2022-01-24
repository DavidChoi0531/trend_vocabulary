import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prototype_02_app/src/controller/main/learning_list_screen_controller.dart';
import 'package:prototype_02_app/src/models/word.dart';

class LearningListScreen extends StatelessWidget {
  LearningListScreen({Key? key}) : super(key: key);

  final LearningListScreenController _controller =
      Get.put(LearningListScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '나의 학습 목록',
          style: TextStyle(color: Colors.black),
        ),
        foregroundColor: Colors.black,
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _controller.getList(),
          builder: (context, AsyncSnapshot<List<Word>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data;
              print(data);
              return ListView.separated(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index].text),
                    trailing: Icon(Icons.navigate_next),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

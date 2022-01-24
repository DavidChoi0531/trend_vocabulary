import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:prototype_02_app/src/data/learning_list/learning_list.dart';
import 'package:prototype_02_app/src/repository/login_api.dart';

class ProfileScreenController extends GetxController {
  RxString userId = ''.obs;

  @override
  onInit() {
    changeUserId(FirebaseAuth.instance.currentUser!.email!);
  }

  changeUserId(String uid) {
    userId(uid);
  }

  deleteAllLearningList() async {
    LearningListDatabase database = LearningListDatabase();
    await database.deleteLearningList();

    return Get.snackbar('알림', '모든 학습 데이터를 삭제하였습니다.',
        snackPosition: SnackPosition.TOP);
  }

  signOut() {
    LoginApi loginApi = LoginApi();
    loginApi.signOut();
  }
}

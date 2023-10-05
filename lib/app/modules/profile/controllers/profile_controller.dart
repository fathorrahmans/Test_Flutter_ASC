import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:test_cli2/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  RxInt selectedTabBar = 0.obs;
  final auth = FirebaseAuth.instance;

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}

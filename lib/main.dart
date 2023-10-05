import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_cli2/app/modules/utils/loading.dart';
import './app/modules/login/controllers/login_controller.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: "Application",
            debugShowCheckedModeBanner: false,
            initialRoute:
                snapshot.data != null ? AppPages.INITIAL : Routes.SPLASH,
            // snapshot.data != null ? Routes.ADD_PROPERTY : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        }
        return LoadingView();
      },
    );
  }
}

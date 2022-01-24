import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/route_manager.dart';
import 'package:prototype_02_app/src/pages/app.dart';
import 'package:prototype_02_app/src/binding/init_binding.dart';
import 'package:prototype_02_app/src/pages/launch/launch_init.dart';
import 'package:prototype_02_app/src/pages/launch/launch_screen_first.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Prototype_02',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      initialBinding: InitBinding(),
      getPages: [
        GetPage(name: '/', page: () => LaunchInit()),
        GetPage(name: '/main', page: () => const App()),
      ],
    );
  }
}

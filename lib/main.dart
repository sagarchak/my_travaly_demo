import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_travaly_demo/binding/app_binding.dart';
import 'package:my_travaly_demo/firebase_options.dart';
import 'package:my_travaly_demo/screens/home_screen.dart';
import 'package:my_travaly_demo/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyTravalyDemo());
}

class MyTravalyDemo extends StatelessWidget {
  const MyTravalyDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Travaly Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orangeAccent,
        ),
        useMaterial3: true,
      ),
      home: Home(),
      initialBinding: AppBinding(),
    );
  }
}

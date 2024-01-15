import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Kiddies Quiz',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF9570FB),
          elevation: 100,
        ),
        backgroundColor: Colors.white,
        body: const SafeArea(child: QuizScreen()),
      ),
    );
  }
}

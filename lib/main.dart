import 'package:al_syllabus_app/pages/home.dart';
import 'package:al_syllabus_app/routes.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Syllabus App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: routes,
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/images/splash1.png',
        ),
        duration: 1000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        nextScreen: const Home(),
      ),
    );
  }
}

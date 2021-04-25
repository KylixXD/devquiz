import 'package:devquiz/HomePage/Home_Page.dart';
import 'package:devquiz/Splash/splash_page.dart';
import 'package:devquiz/challenge/challenge_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

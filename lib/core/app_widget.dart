import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:devquiz/HomePage/Home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: ChallengePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

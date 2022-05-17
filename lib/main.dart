import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cs310_mainproject/Screens/Welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'colors.dart' as color;

void main() {
  runApp(const MyApp());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.network("https://assets10.lottiefiles.com/private_files/lf30_fhbalxer.json"),
      splashIconSize: 2000,
      //backgroundColor: Colors.deepPurpleAccent,
      nextScreen: const WelcomeScreen(),
      animationDuration: const Duration(seconds: 3,),
      backgroundColor: color.AppColor.WelcomeBackground,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: color.AppColor.secondPageTopIconColor,
        scaffoldBackgroundColor: color.AppColor.WelcomeBackground,
      ),
      home: SplashScreen(),
    );
  }
}
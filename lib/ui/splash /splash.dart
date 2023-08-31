import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sys/ui/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "Splash-Screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 300,
        splash: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/logo.jpg"),
          )),
        ),
        nextScreen: LoginScreen());
  }
}

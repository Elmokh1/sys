import 'package:flutter/material.dart';
import 'package:sys/ui/homepage/home_page.dart';
import 'package:sys/ui/login/login_screen.dart';
import 'package:sys/ui/splash%20/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomePage.routeName: (context) => HomePage(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}

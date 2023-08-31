import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../network/api/apiManger.dart';
import '../homepage/home_page.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "Login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset("assets/images/logo.jpg"),
                  Text(
                    "Welcome back!",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter an email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        login();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('SysGates'),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    String email = emailController.text;
    String password = passwordController.text;

    Api.login(email, password).then((data) {
      // Process the response data as needed
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Login Failed'),
          content: Text(error.toString()),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      );
    });
  }
}
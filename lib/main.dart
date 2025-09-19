import 'package:flutter/material.dart';
// import 'package:instagram_clone_/controller.dart';
import 'package:instagram_clone_/sign_up.dart';
import 'package:instagram_clone_/home_page.dart';
import 'package:instagram_clone_/login_page.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget firstWidget = await firstScreen();

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: firstWidget));
}

Future<Widget> firstScreen() async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString('isSignUp') == 'true') {
    if (prefs.getBool('isLogin') == true) {
      return HomePage();
    } else {
      return LoginPage();
    }
  } else {
    return SignUpPage();
  }
}
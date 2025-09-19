import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone_/home_page.dart';
import 'package:instagram_clone_/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: [
            const SizedBox(height: 40),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "English (India) ",
                    style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                  ),
                  FaIcon(FontAwesomeIcons.chevronDown,color: Colors.grey, size: 15,)
                ],
              ),
            ),
            const SizedBox(height: 170),
            const Text(
              'Instagram',
              style: TextStyle(fontSize: 64, fontFamily: 'Cookie'),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            TextFormField(
              controller: idController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Phone number, email or username',
                hintStyle: const TextStyle(fontSize: 16),
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Password',
                hintStyle: const TextStyle(fontSize: 16),
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                suffixIcon: const Icon(Icons.remove_red_eye),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () async {
                if (await Login().login(
                  idController.text.trim(),
                  passController.text.trim(),
                )) {
                  idController.clear();
                  passController.clear();

                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('isLogin', true);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Username or Password is incorrect!'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Log In',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Forgot your login details?',
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            Text(
              'Get help logging in.',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("OR", style: TextStyle(color: Colors.grey)),
                ),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.facebook, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  "Log in with Facebook",
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 120),
            const Divider(),
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: ()async {
                   final prefs = await SharedPreferences.getInstance();
                   await prefs.setString('isSignUp', 'false');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

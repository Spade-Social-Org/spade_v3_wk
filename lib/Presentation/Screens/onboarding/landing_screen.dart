import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:spade_v4/Common/navigator.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/login/input_email.dart';
import 'package:spade_v4/Presentation/widgets/custom_button.dart';
import 'signup/hello_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    onInit();
    super.initState();
  }

  void onInit() => Future.delayed(
      const Duration(seconds: 1), () => FlutterNativeSplash.remove());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset("assets/images/onboarding1.png", height: 60),
            const Text(
              'A different experience...',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                letterSpacing: 3,
              ),
            ),
            const Spacer(),
            CustomButton(
              color: Colors.black,
              text: 'Create Account',
              radius: 12,
              onPressed: () => push(const HelloScreen()),
            ),
            const SizedBox(height: 30),
            CustomButton(
              borderSide: BorderSide(color: Color(0xff9A9A9A)),
              text: 'Login',
              textColor: Colors.black,
              radius: 12,
              onPressed: () => push(const InputEmail()),
            ),
            const SizedBox(height: 20),
            RichText(
                text: TextSpan(
                    text: 'By clicking',
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      text: ' ‘Create acount’',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  TextSpan(text: ' or'),
                  TextSpan(
                      text: ' ‘Log in’,',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          ' I state that I have read and understood the terms and conditions.'),
                ])),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

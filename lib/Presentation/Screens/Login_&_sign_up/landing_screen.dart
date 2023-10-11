import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:spade_v4/Presentation/Screens/Login_&_sign_up/input_email.dart';
import '../../widgets/jh_logger.dart';
import '../Onboarding_screen/hello_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    initialization();
    super.initState();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    logger.d('Let\'s go!! we are here');
    FlutterNativeSplash.remove();
  }

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
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                  height: 50,
                  minWidth: double.infinity,
                  color: Colors.black,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const HelloScreen())));
                  }),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // _loaderOn();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const InputEmail())));
                  },
                  child: Container(
                    height: 47.59,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: const Center(
                      child: Text(
                        "Log in",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
                "By clicking ‘Create acount’ or ‘Log in’, I state that I have read and understood the terms and conditions. ",
                textAlign: TextAlign.center),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

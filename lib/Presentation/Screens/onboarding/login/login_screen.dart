import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:spade_v4/Common/navigator.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/signup/first_name_screen.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/widgets/form_labels.dart';
import 'package:spade_v4/Presentation/widgets/custom_button.dart';
import 'package:spade_v4/Presentation/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final form = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  bool obscureText = true;
  bool isChecked = false;
  void get onIconToggle => setState(() => obscureText = !obscureText);
  IconData get icon => !obscureText ? Icons.visibility : Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: form,
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Image.asset("assets/images/onboarding1.png", height: 60),
                  const Text(
                    'A different experience...',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        letterSpacing: 3),
                  ),
                  const SizedBox(height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel(formLabel: "Email or Phone number"),
                      const SizedBox(height: 8),
                      CustomTextfield(
                          controller: email,
                          hintText: 'Enter your email or phone number'),
                      const SizedBox(height: 20),
                      const FormLabel(formLabel: "Password"),
                      const SizedBox(height: 8),
                      CustomTextfield(
                        controller: password,
                        hintText: 'Password',
                        obscureText: obscureText,
                        suffixIcon: IconButton(
                            onPressed: () => onIconToggle, icon: Icon(icon)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () => setState(() => isChecked = !isChecked),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox.adaptive(
                                value: isChecked,
                                onChanged: (val) =>
                                    setState(() => isChecked = val!)),
                            const Text(
                              'Remember me',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {})
                    ],
                  ),
                  const SizedBox(height: 100),
                  CustomButton(
                    color: Colors.black,
                    text: 'Login',
                    onPressed: () {
                      push(Container());
                    },
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: CustomButton(
                        height: 40,
                        onPressed: () => push(const FirstNameScreen()),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            SizedBox(width: 4),
                            Text('Create Account',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                ))
                          ],
                        )),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

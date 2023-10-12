import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validator/form_validator.dart';
import 'package:spade_v4/Presentation/Screens/Buttom_nav/navigation_container.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/provider/onboarding_provider.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/widgets/form_labels.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/widgets/form_title.dart';

import '../../../../Common/navigator.dart';
import '../model/login_model.dart';

class LoginPassword extends StatefulWidget {
  final String email;
  const LoginPassword({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<LoginPassword> createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  bool obscureText = true;
  final passwordCrtl = TextEditingController();
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            )),
                        const SizedBox(height: 25),
                        const Center(
                            child: FormTitle(
                                formTitle: "Please enter your password")),
                        const SizedBox(height: 100),
                        const FormLabel(formLabel: "Password"),
                        SizedBox(height: 8),
                        TextFormField(
                          obscureText: obscureText,
                          controller: passwordCrtl,
                          style: const TextStyle(fontSize: 14),
                          cursorColor: Colors.black,
                          validator: ValidationBuilder()
                              .minLength(5)
                              .maxLength(50)
                              .build(),
                          decoration: InputDecoration(
                            suffixIcon: Align(
                              heightFactor: 1.0,
                              widthFactor: 1.0,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  icon: Icon(
                                    !obscureText
                                        ? CupertinoIcons.eye_slash_fill
                                        : CupertinoIcons.eye_fill,
                                    color: Colors.grey,
                                  )),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            hintText: "Enter Password",
                            hintStyle: const TextStyle(fontSize: 14),
                            errorStyle: const TextStyle(color: Colors.black),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
              Consumer(builder: (context, ref, _) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                      height: 50,
                      minWidth: double.infinity,
                      color: Colors.black,
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () async {
                        if (form.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          final model = LoginModel(
                              email: widget.email.trim(),
                              password: passwordCrtl.text.trim());
                          await ref
                              .read(onboardingProvider)
                              .login(model)
                              .then((value) {
                            if (value.statusCode == 'SUCCESS') {
                              push(const NavigationContainer());
                            }
                          });
                        }
                      }),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

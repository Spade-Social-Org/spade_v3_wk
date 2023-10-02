// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:spade_v4/Common/extensions/size_config_extension/size_config_extension.dart';
import 'package:spade_v4/Presentation/Screens/Buttom_nav/navigation_container.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_labels.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/save_user_tokens/save_user_tokens.dart';

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
  final pwController = TextEditingController();
  final form = GlobalKey<FormState>();
  final dio = Dio();

  Future postData(String password) async {
    try {
      var url =
          'https://spade-backend-v3-production.up.railway.app/api/v1/auth/login';
      var response = await dio.post(url, data: {
        "email": widget.email,
        "password": password,
      }).timeout(const Duration(seconds: 60));
      log(response.data);
      return response;
    } on TimeoutException {
      return "Service unavailable!";
    } catch (e) {
      return e.toString();
    }
  }

  _loaderOn() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Container(
          color: Colors.white,
          child: Center(child: Image.asset("assets/images/ShuffleE.gif")),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Form(
            key: form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Center(
                    child: FormTitle(formTitle: "Please enter your password")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FormLabel(formLabel: "Password"),
                    SizedBox(
                      height: 8.height(),
                    ),
                    TextFormField(
                      obscureText: obscureText,
                      controller: pwController,
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
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Builder(builder: (context) {
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
                            _loaderOn();
                            await postData(pwController.text).then((value) {
                              if (value == true) {
                                SaveUserToken.saveLoginValue(value);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const NavigationContainer())));
                              } else {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  backgroundColor: Colors.black,
                                  content: Text(
                                    value.data,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  action: SnackBarAction(
                                    label: 'Retry',
                                    onPressed: () {},
                                  ),
                                ));
                              }
                            });
                          }
                        }),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

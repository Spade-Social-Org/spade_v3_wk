// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

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
  final pwController = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  final dio = Dio();

  Future postData(String password) async {
    try {
      var url =
          'https://spade-backend-v3-production.up.railway.app/api/v1/auth/login';
      var response = await dio.post(url, data: {
        "email": widget.email,
        "password": password,
      }).timeout(const Duration(seconds: 60));
      print(response.statusCode);
      return true;
    } on TimeoutException {
      return "Service unavailable!";
    } catch (e) {
      return e.toString();
    }
  }

  // Future<void> _showDialogLoader() {
  //   return showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (ctx) => AlertDialog(
  //       backgroundColor: Colors.white,
  //       content: Container(
  //         height: 60,
  //         alignment: Alignment.center,
  //         color: Colors.white,
  //         padding: EdgeInsets.all(10),
  //         child: CircularProgressIndicator(
  //           color: Colors.black,
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(child: FormTitle(formTitle: "Please create a password")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormLabel(formLabel: "Password"),
                    SizedBox(
                      height: 8.height(),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: pwController,
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.black,
                      validator: ValidationBuilder()
                          .minLength(5)
                          .maxLength(50)
                          .build(),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        hintText: "Enter Password",
                        hintStyle: TextStyle(fontSize: 14),
                        errorStyle: TextStyle(color: Colors.black),
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
                SizedBox(
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
                          if (_form.currentState!.validate()) {
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
                                    value,
                                    style: TextStyle(color: Colors.white),
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

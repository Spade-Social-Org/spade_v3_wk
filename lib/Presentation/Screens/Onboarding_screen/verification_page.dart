import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/Buttom_nav/navigation_container.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/save_user_tokens/save_user_tokens.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  final thirdController = TextEditingController();
  final forthController = TextEditingController();
  final fifthController = TextEditingController();
  final sixthController = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  bool loader = false;
  final dio = Dio();

  String validate = "";

  Future postData(String val) async {
    try {
      var url =
          'https://spade-backend-v3-production.up.railway.app/api/v1/auth/otp/verify';
      var response = await dio
          .post(url, data: {"otp": val}).timeout(const Duration(seconds: 60));
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
    return loader
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          )
        : Scaffold(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(child: FormTitle(formTitle: "Verification Code")),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _form,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Enter the OTP sent to your email",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                elevation: 3,
                                color: Colors.white,
                                child: SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: TextFormField(
                                    autofocus: true,
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    controller: firstController,
                                    maxLength: 1,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      counterText: "",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Card(
                                elevation: 3,
                                color: Colors.white,
                                child: SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: TextFormField(
                                    autofocus: true,
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    controller: secondController,
                                    maxLength: 1,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      counterText: "",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Card(
                                elevation: 3,
                                color: Colors.white,
                                child: SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: TextFormField(
                                    autofocus: true,
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    controller: thirdController,
                                    maxLength: 1,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      counterText: "",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Card(
                                elevation: 3,
                                color: Colors.white,
                                child: SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: TextFormField(
                                    autofocus: true,
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    controller: forthController,
                                    maxLength: 1,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      counterText: "",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Card(
                                elevation: 3,
                                color: Colors.white,
                                child: SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: TextFormField(
                                    autofocus: true,
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    controller: fifthController,
                                    maxLength: 1,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      counterText: "",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Card(
                                elevation: 3,
                                color: Colors.white,
                                child: SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: TextFormField(
                                    autofocus: true,
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                    },
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.0),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    controller: sixthController,
                                    maxLength: 1,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      counterText: "",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          validate.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    validate,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.red),
                                  ),
                                )
                              : const SizedBox(),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                text: "Don't receive code? ",
                                style: TextStyle(fontSize: 14),
                              ),
                              TextSpan(
                                text: "Re-send",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            ]),
                          ),
                        ],
                      ),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () async {
                              var val = firstController.text +
                                  secondController.text +
                                  thirdController.text +
                                  forthController.text +
                                  fifthController.text +
                                  sixthController.text;

                              if (firstController.text.isNotEmpty &&
                                  secondController.text.isNotEmpty &&
                                  thirdController.text.isNotEmpty &&
                                  forthController.text.isNotEmpty &&
                                  fifthController.text.isNotEmpty &&
                                  sixthController.text.isNotEmpty) {
                                _loaderOn();
                                await postData(val).then((value) {
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
                              } else {
                                setState(() {
                                  validate = "Please Enter OTP";
                                });
                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(SnackBar(
                                //   backgroundColor: Colors.black,
                                //    content: Text(
                                //     "Please Enter OTP",
                                //    style: TextStyle(color: Colors.white),
                                //  ),
                                // action: SnackBarAction(
                                //    label: 'Ok',
                                //    onPressed: () {},
                                //  ),
                                // ));
                              }
                            }),
                      );
                    }),
                  ],
                ),
              ),
            ),
          );
  }
}

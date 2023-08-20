// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import 'package:spade_v4/Common/extensions/size_config_extension/size_config_extension.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_labels.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/verification_page.dart';

class InputEmailScreen extends StatefulWidget {
  final String name;
  final String password;
  final String phoneNumber;
  final String countryValue;
  final String stateValue;
  final String cityValue;
  final String postCode;
  const InputEmailScreen({
    Key? key,
    required this.name,
    required this.password,
    required this.phoneNumber,
    required this.countryValue,
    required this.stateValue,
    required this.cityValue,
    required this.postCode,
  }) : super(key: key);

  @override
  State<InputEmailScreen> createState() => _InputEmailScreenState();
}

class _InputEmailScreenState extends State<InputEmailScreen> {
  final controller = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  final dio = Dio();

  Future postData(String email) async {
    try {
      var url = 'https://spade-social.onrender.com/api/v1/auth/signup';
      var response = await dio.post(url, data: {
        "email": email,
        "password": widget.password,
        "name": widget.name,
        "phone_number": widget.phoneNumber,
        "country": widget.countryValue,
        "city": widget.cityValue,
        "state": widget.stateValue,
        "postal_code": widget.postCode,
      });
      print(response.statusCode);
      return true;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> _showDialogLoader() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          height: 60,
          alignment: Alignment.center,
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
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
                Center(child: FormTitle(formTitle: "Whats your email?")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormLabel(formLabel: "Email"),
                    SizedBox(
                      height: 8.height(),
                    ),
                    TextFormField(
                      controller: controller,
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.black,
                      validator:
                          ValidationBuilder().email().maxLength(50).build(),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        hintText: "Enter your email",
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
                            if (controller.text.isNotEmpty) {
                              _showDialogLoader();
                              await postData(controller.text).then((value) {
                                if (value == true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const VerificationPage())));
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
                                      label: 'Ok',
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ));
                                }
                              });
                            }
                          }
                        }),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

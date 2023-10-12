// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import 'package:spade_v4/Presentation/Screens/onboarding/widgets/form_labels.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/widgets/form_title.dart';

import 'input_phone_number_screen.dart';

class InputPassword extends StatefulWidget {
  final String name;
  const InputPassword({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool obscureText = true;
  bool cnObscureText = true;
  final pwController = TextEditingController();
  final cnPwController = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();

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
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Center(
                    child: FormTitle(formTitle: "Please create a password")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FormLabel(formLabel: "Password"),
                    const SizedBox(height: 8),
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
                    const SizedBox(height: 15),
                    const FormLabel(formLabel: "Confirm Password"),
                    const SizedBox(height: 8),
                    TextFormField(
                      obscureText: cnObscureText,
                      controller: cnPwController,
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
                                cnObscureText = !cnObscureText;
                              });
                            },
                            icon: Icon(
                              !cnObscureText
                                  ? CupertinoIcons.eye_slash_fill
                                  : CupertinoIcons.eye_fill,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        hintText: "Confirm Password",
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
                  height: 90,
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
                            if (pwController.text == cnPwController.text) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          InputPhoneNumberScreen(
                                              name: widget.name,
                                              password: pwController.text))));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.black,
                                content: const Text(
                                  "Password doesn't match",
                                  style: TextStyle(color: Colors.white),
                                ),
                                action: SnackBarAction(
                                  label: 'Ok',
                                  onPressed: () {
                                    //    Navigator.pop(context);
                                  },
                                ),
                              ));
                            }
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

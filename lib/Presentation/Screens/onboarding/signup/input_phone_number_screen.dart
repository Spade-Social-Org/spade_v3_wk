// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import 'package:spade_v4/Common/extensions/size_config_extension/size_config_extension.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/widgets/form_labels.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/widgets/form_title.dart';

import 'add_location_screen.dart';

class InputPhoneNumberScreen extends StatefulWidget {
  final String name;
  final String password;
  const InputPhoneNumberScreen({
    Key? key,
    required this.name,
    required this.password,
  }) : super(key: key);

  @override
  State<InputPhoneNumberScreen> createState() => _InputPhoneNumberScreenState();
}

class _InputPhoneNumberScreenState extends State<InputPhoneNumberScreen> {
  final controller = TextEditingController();
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
                Center(child: FormTitle(formTitle: "Whats your phone number?")),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormLabel(formLabel: "Mobile Number"),
                    SizedBox(
                      height: 8.height(),
                    ),
                    TextFormField(
                      controller: controller,
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      validator:
                          ValidationBuilder().phone().maxLength(50).build(),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        hintText: "+1-400-200-9000",
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => AddLocationScreen(
                                        name: widget.name,
                                        password: widget.password,
                                        phoneNumber: controller.text))));
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

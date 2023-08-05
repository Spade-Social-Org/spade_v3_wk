import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/size_config_extension/size_config_extension.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/input_phone_number_screen.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_labels.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/txt_form_field.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({super.key});

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
   final controller = TextEditingController();
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
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(child: FormTitle(formTitle: "Please create a password")),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormLabel(formLabel: "Password"),
                  SizedBox(
                    height: 8.height(),
                  ),
                  TxtFormField(
                    controller: controller,
                    hintText: 'Password',
                  ),
                  SizedBox(
                    height: 15.height(),
                  ),
                  FormLabel(formLabel: "Confirm Password"),
                  SizedBox(
                    height: 8.height(),
                  ),
                  TxtFormField(
                    controller: controller,
                    hintText: 'Confirm Password',
                  ),
                ],
              ),
                   SizedBox(
                      height: 90,
                    ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                      height: 50,
                      minWidth: double.infinity,
                      color: Colors.black,
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const InputPhoneNumberScreen())));
                      }),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
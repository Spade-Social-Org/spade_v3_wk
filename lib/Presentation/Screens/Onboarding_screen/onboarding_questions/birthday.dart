import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/input_password.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_labels.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/txt_form_field.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding_questions/identity.dart';

class BirthdayQuestion extends StatefulWidget {
  const BirthdayQuestion({super.key});

  @override
  State<BirthdayQuestion> createState() => _BirthdayQuestionState();
}

class _BirthdayQuestionState extends State<BirthdayQuestion> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: FormTitle(formTitle: "When's your birthday?")),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormLabel(formLabel: "Birthday"),
                  SizedBox(
                    height: 8.height(),
                  ),
                  TxtFormField(
                    controller: controller,
                    hintText: 'DD : MM : YYYY',
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
                              builder: ((context) => const Identity())));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

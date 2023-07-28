import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/size_config_extension/size_config_extension.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/input_email_screen.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_labels.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/txt_form_field.dart';

class InputPhoneNumberScreen extends StatefulWidget {
  const InputPhoneNumberScreen({super.key});

  @override
  State<InputPhoneNumberScreen> createState() => _InputPhoneNumberScreenState();
}

class _InputPhoneNumberScreenState extends State<InputPhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        padding: const EdgeInsets.all(18),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 40.height(),
            ),
            const Center(
                child: FormTitle(formTitle: "What's your phone number")),
            SizedBox(
              height: 40.height(),
            ),
            FormLabel(formLabel: "Mobile Number"),
            SizedBox(
              height: 8.height(),
            ),
            TxtFormField(
              controller: controller,
              hintText: 'Enter your mobile number',
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ClipRRect(
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
                              builder: ((context) =>
                                  const InputEmailScreen())));
                    }),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

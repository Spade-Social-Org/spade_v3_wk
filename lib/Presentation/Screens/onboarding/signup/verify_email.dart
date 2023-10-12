import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:spade_v4/Common/navigator.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/signup/add_location_screen.dart';

import 'package:spade_v4/Presentation/Screens/onboarding/widgets/form_labels.dart';
import 'package:spade_v4/Presentation/Screens/onboarding/widgets/form_title.dart';
import 'package:spade_v4/Presentation/widgets/custom_button.dart';

class VerifyEmail extends StatefulWidget {
  final String name;
  final String password;
  final String phoneNumber;
  final String email;
  const VerifyEmail({
    Key? key,
    required this.name,
    required this.password,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final otp = TextEditingController();
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                      child: FormTitle(formTitle: "Verification Code")),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
                  const FormLabel(
                      formLabel: "Enter the OTP sent to your email"),
                  const SizedBox(height: 5),
                  Pinput(
                    autofocus: true,
                    controller: otp,
                    validator: (value) =>
                        value!.length != 4 ? 'Field is required' : null,
                    hapticFeedbackType: HapticFeedbackType.vibrate,
                    defaultPinTheme: PinTheme(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 16),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: CustomButton(
                        height: 40,
                        onPressed: () => {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Didn\'t receive code?',
                            ),
                            SizedBox(width: 4),
                            Text('Re-send',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ))
                          ],
                        )),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
                  CustomButton(
                      color: Colors.black,
                      text: 'Next',
                      onPressed: () async {
                        if (form.currentState!.validate()) {
                          push(AddLocationScreen(
                              name: widget.name,
                              email: widget.email,
                              password: widget.password,
                              phoneNumber: widget.phoneNumber));
                        }
                      }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

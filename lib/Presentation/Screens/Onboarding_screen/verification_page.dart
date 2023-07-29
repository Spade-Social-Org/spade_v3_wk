import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/add_location_screen.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
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
              Center(child: FormTitle(formTitle: "Verification Code")),
                  SizedBox(
                    height: 20,
                  ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Enter the OTP sent to your email",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  SizedBox(
                    height: 60,
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
                              builder: ((context) =>
                                  const AddLocationScreen())));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/Buttom_nav/navigation_container.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';

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
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  final dio = Dio();

  Future postData(String val) async {
    try {
      var url = 'https://spade-social.onrender.com/api/v1/auth/otp/verify';
      var response = await dio.post(url, data: {"otp": val});
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
        backgroundColor: Colors.transparent,
        content: Container(
          height: 60,
          alignment: Alignment.center,
          color: Colors.transparent,
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
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 64.0,
                          width: 56.0,
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Expanded(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: firstController,
                                  maxLength: 1,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: InputDecoration(
                                    hintText: "*",
                                    hintStyle: TextStyle(
                                        color: Colors.black, fontSize: 20.0),
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
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 64.0,
                          width: 56.0,
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Expanded(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: secondController,
                                  maxLength: 1,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: InputDecoration(
                                    hintText: "*",
                                    hintStyle: TextStyle(
                                        color: Colors.black, fontSize: 20.0),
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
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 64.0,
                          width: 56.0,
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Expanded(
                                child: TextField(
                                  style: TextStyle(
                                        color: Colors.black, fontSize: 20.0),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: thirdController,
                                  maxLength: 1,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: InputDecoration(
                                    hintText: "*",
                                    hintStyle: TextStyle(
                                        color: Colors.black, fontSize: 20.0),
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
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 64.0,
                          width: 56.0,
                          child: Card(
                            elevation: 4,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Expanded(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  controller: forthController,
                                  maxLength: 1,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: InputDecoration(
                                    hintText: "*",
                                    hintStyle: TextStyle(
                                        color: Colors.black, fontSize: 20.0),
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
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
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
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () async {
                        var val = firstController.text +
                            secondController.text +
                            thirdController.text +
                            forthController.text;
                        if (firstController.text.isNotEmpty &&
                            secondController.text.isNotEmpty &&
                            thirdController.text.isNotEmpty &&
                            forthController.text.isNotEmpty) {
                          _showDialogLoader();
                          await postData(val).then((value) {
                            if (value == true) {
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
                                  label: 'Ok',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ));
                            }
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.black,
                            content: Text(
                              "Please Enter OTP",
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app/Common/extensions/size_config_extension/size_config_extension.dart';
import 'package:app/Presentation/Screens/Login_&_sign_up/login_password.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({
    Key? key,
  }) : super(key: key);

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  final controller = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  // final dio = Dio();

  // Future postData(String password) async {
  //   try {
  //     var url = 'https://spade-social.onrender.com/api/v1/auth/login';
  //     var response = await dio.post(url, data: {
  //       "email": widget.email,
  //       "password": password,

  //     });
  //     print(response.statusCode);
  //     return true;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

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
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.height(),
                    ),
                    TextFormField(
                      controller: controller,
                      style: const TextStyle(fontSize: 14),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        hintText: "Enter your email",
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
                                    builder: ((context) => LoginPassword(
                                        email: controller.text))));
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

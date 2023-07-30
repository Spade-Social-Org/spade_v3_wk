import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'input_email_screen.dart';

class InputPhoneNumberScreen extends StatelessWidget {

  const InputPhoneNumberScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
              top: 30,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Center(
              child: Text(
            "What's your phone number?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              //add country code to the left side of the screen
             
            ),
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
                  child: const Text("Next",style: TextStyle(color: Colors.white,fontSize: 20),),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>  InputEmailScreen())));
                  }),
              ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
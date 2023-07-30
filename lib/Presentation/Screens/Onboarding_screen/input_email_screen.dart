import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'add_location_screen.dart';

class InputEmailScreen extends StatelessWidget {

  const InputEmailScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Icon(
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
            "What's your email?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Email Address",
              ),
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
                            builder: ((context) =>  AddLocationScreen())));
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
import'package:flutter/material.dart';

import 'input_identityy_screen.dart';


class InputBirthdayScreen extends StatelessWidget {
  const InputBirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            "When is your birthday ?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                width: 70,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "DD",
                    
                  ),
                ),
              ),
              SizedBox(width: 30,),
              SizedBox(
                width: 70,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "MM",
                    
                  ),
                ),
              ),
              SizedBox(width: 30,),
               SizedBox(
                width: 70,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "YYYY",
                    
                  ),
                ),
              ),
            ],
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
                            builder: ((context) => const MyIdentityScreen())));
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
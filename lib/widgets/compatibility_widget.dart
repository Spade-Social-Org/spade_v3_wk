import 'dart:ui';

import 'package:flutter/material.dart';

class CompatibilityWidget extends StatelessWidget {
  const CompatibilityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF155332),
            ),
           // color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20)),
        height: 500,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.only(top: 30,bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:const [
                   Text(
                    "Compatibility",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(width: 20,),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 18,
                    child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Text("X",style: TextStyle(color: Colors.grey,fontSize: 20),)
                        )),
                  )
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left:30.0,right: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 35,
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 30,
                                width: 190,
                                color: Colors.grey,
                                child: const Center(child: Text("Personality 90%")),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 9,),
               Padding(
                padding: const EdgeInsets.only(left:30.0,right: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 35,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 30,
                            width: 160,
                            color: const Color.fromARGB(255, 27, 81, 28),
                                child: const Center(child: Text("Attractivness 70%")),
                          ),
                        ),
                       const  Spacer(),
                       const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ),
               const SizedBox(height: 9,),
               Padding(
                padding: const EdgeInsets.only(left:30.0,right: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 35,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 30,
                            width: 130,
                            color: const Color.fromARGB(255, 101, 32, 15),
                                child: const Center(child: Text("Volumn 50%")),
                          ),
                        ),
                       const  Spacer(),
                       const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ),
               const SizedBox(height: 9,),
               Padding(
                padding: const EdgeInsets.only(left:30.0,right: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 35,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 30,
                            width: 110,
                            color: const Color.fromARGB(255, 193, 165, 5),
                                child: const Center(child: Text("Activities 40%")),
                          ),
                        ),
                       const  Spacer(),
                       const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

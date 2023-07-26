import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompatibilityWidget extends StatelessWidget {
  const CompatibilityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
      child: Container(
        height: screenHeight * 0.56,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:const [
                Text(
                  "Compatibility",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, fontSize: 24),

                ),
                // SizedBox(width: 20,),
                CircleAvatar(
                  backgroundColor: Colors.white,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                height: 150,
                child: Image.asset(
                  'assets/images/per_pie.svg.png',
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  // Replace with your SVG file path
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:30.0,right: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 26,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 26,
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
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:30.0,right: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 26,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 26,
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
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:30.0,right: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 26,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 26,
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
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:30.0,right: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 26,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 26,
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
    );
  }
}

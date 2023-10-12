import 'package:flutter/material.dart';


import 'looking_for_build_men_screen.dart';
import 'looking_for_build_women_screen.dart';

class WhatLookingForScreen extends StatefulWidget {
  const WhatLookingForScreen({super.key});

  @override
  State<WhatLookingForScreen> createState() => _WhatLookingForScreenState();
}

class _WhatLookingForScreenState extends State<WhatLookingForScreen> {
  String? _selectedType;

  void _selectType(String type) {
    setState(() {
      _selectedType = type;
    });
  }


  void _navigateToNextScreen() {
    if (_selectedType == 'Man') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LookingForBuildMenScreen()),
      );
    } else if (_selectedType == 'Woman') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LookingForBuildWomenScreen()),
      );
    } else if (_selectedType == 'Friends') {
     
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LookingForBuildMenScreen()),
      );
    } else if (_selectedType == 'Other') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LookingForBuildMenScreen()),
      );
    }
  }

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
                  onTap: () {
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
              "What are you looking for ?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _selectType('Man'),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: _selectedType == 'Man'
                        ? Colors.grey[300]
                        : Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, offset: Offset(0.0, 4.0))
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 140,
                  width: 146,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 80,
                            child: Image.asset(
                              "assets/images/man.png",
                              fit: BoxFit.fill,
                            )),
                        Text("Man")
                      ]),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () => _selectType('Woman'),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: _selectedType == 'Woman'
                        ? Colors.grey[300]
                        : Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, offset: Offset(0.0, 4.0))
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 140,
                  width: 146,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 80,
                            child: Image.asset(
                              "assets/images/woman.png",
                              fit: BoxFit.fill,
                            )),
                        Text("Woman")
                      ]),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _selectType('Friends'),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: _selectedType == 'Friends'
                        ? Colors.grey[300]
                        : Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, offset: Offset(0.0, 4.0))
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 140,
                  width: 146,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 80,
                            child: Image.asset(
                              "assets/images/friends.png",
                              fit: BoxFit.fill,
                            )),
                        Text("Friends")
                      ]),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () => _selectType('Other'),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: _selectedType == 'Other'
                        ? Colors.grey[300]
                        : Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, offset: Offset(0.0, 4.0))
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 140,
                  width: 146,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 80,
                            child: Image.asset("assets/images/other2.png")),
                        const Text("Other")
                      ]),
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
                onPressed: _selectedType != null ? _navigateToNextScreen : null,
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
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

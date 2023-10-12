import 'package:flutter/material.dart';

import 'height_selection_screen_men.dart';
import 'height_selection_screen_women.dart';
import 'looking_for_build_men_screen.dart';

class MyIdentityScreen extends StatefulWidget {
  const MyIdentityScreen ({super.key});

  @override
  State<MyIdentityScreen> createState() => _MyIdentityScreenState();
}

class _MyIdentityScreenState extends State<MyIdentityScreen> {

  String? _selectedGender;

  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

   void _navigateToNextScreen() {
    if (_selectedGender == 'Man') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HeightSelectionScreen()),
      );
    } else if (_selectedGender == 'Woman') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HeightSelectionWomenScreen()),
      );
    } else if (_selectedGender == 'Other') {
     
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LookingForBuildMenScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "What do you identify as ?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          const SizedBox(height: 150,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () { _selectGender('Man');},
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedGender == 'Man' ? Colors.grey[300] : Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 4.0)
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 120,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/man.png"),
                      const Text("Man")
                    ]
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _selectGender('Woman'),
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedGender == 'Woman' ? Colors.grey[300] : Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 4.0)
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 120,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/woman.png"),
                      const Text("Woman")
                    ]
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _selectGender('Other'),
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedGender == 'Other' ? Colors.grey[300] : Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 4.0)
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 120,
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/other.png"),
                      const Text("Other")
                    ]
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
                onPressed: _selectedGender != null ? _navigateToNextScreen : null,
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






import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/question_progress.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding_questions/question7.dart';

class Question6 extends StatefulWidget {
  const Question6({super.key});

  @override
  State<Question6> createState() => _Question6State();
}

class _Question6State extends State<Question6> {
  String groupValue = "Travel around with my loved ones";
  bool _q1 = true;
  bool _q2 = false;
  bool _q3 = false;
  bool _q4 = false;
  bool _q5 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(18, 15, 18, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QProgess(
              index: 6,
            ),
            SizedBox(
              height: 25,
            ),
            FormTitle(formTitle: "What do you like to do in your free time?"),
            SizedBox(
              height: 25,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          color: _q1 ? Colors.black : Colors.white),
                      child: RadioListTile(
                        groupValue: groupValue,
                        activeColor: Colors.white,
                        onChanged: (String? value) {
                          setState(() {
                            groupValue = value!;
                            _q1 = true;
                            _q2 = false;
                            _q3 = false;
                            _q4 = false;
                            _q5 = false;
                          });
                        },
                        title: Text(
                          'Travel around with my loved ones.',
                          style: TextStyle(
                              color: _q1 ? Colors.white : Colors.black),
                        ),
                        value: "Travel around with my loved ones",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          color: _q2 ? Colors.black : Colors.white),
                      child: RadioListTile(
                        groupValue: groupValue,
                        activeColor: Colors.white,
                        onChanged: (String? value) {
                          setState(() {
                            groupValue = value!;
                            _q1 = false;
                            _q2 = true;
                            _q3 = false;
                            _q4 = false;
                            _q5 = false;
                          });
                        },
                        title: Text(
                          'Sit on a couch and spend the evening with my special one.',
                          style: TextStyle(
                              color: _q2 ? Colors.white : Colors.black),
                        ),
                        value:
                            "Sit on a couch and spend the evening with my special one.",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          color: _q4 ? Colors.black : Colors.white),
                      child: RadioListTile(
                        groupValue: groupValue,
                        activeColor: Colors.white,
                        onChanged: (String? value) {
                          setState(() {
                            groupValue = value!;
                            _q1 = false;
                            _q2 = false;
                            _q3 = false;
                            _q4 = true;
                            _q5 = false;
                          });
                        },
                        title: Text(
                          'Plan for the birthdays or anniversaries of my friends and family',
                          style: TextStyle(
                              color: _q4 ? Colors.white : Colors.black),
                        ),
                        value:
                            "Plan for the birthdays or anniversaries of my friends and family",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          color: _q5 ? Colors.black : Colors.white),
                      child: RadioListTile(
                        groupValue: groupValue,
                        activeColor: Colors.white,
                        onChanged: (String? value) {
                          setState(() {
                            groupValue = value!;
                            _q1 = false;
                            _q2 = false;
                            _q3 = false;
                            _q4 = false;
                            _q5 = true;
                          });
                        },
                        title: Text(
                          'Visit an orphanage and spend time with children.',
                          style: TextStyle(
                              color: _q5 ? Colors.white : Colors.black),
                        ),
                        value:
                            "Visit an orphanage and spend time with children.",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                      color: _q3 ? Colors.black : Colors.white),
                  child: RadioListTile(
                    groupValue: groupValue,
                    activeColor: Colors.white,
                    onChanged: (String? value) {
                      setState(() {
                        groupValue = value!;
                        _q1 = false;
                        _q2 = false;
                        _q3 = true;
                        _q4 = false;
                        _q5 = false;
                      });
                    },
                    title: Text(
                      'Call my dear ones and tell them how valuable they are to me',
                      style:
                          TextStyle(color: _q3 ? Colors.white : Colors.black),
                    ),
                    value:
                        "Call my dear ones and tell them how valuable they are to me",
                  ),
                ),
                SizedBox(
                  height: 60,
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
                                    const Question7())));
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

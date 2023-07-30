import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/question_progress.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/questions_enum.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding_questions/question3.dart';

class Question2 extends StatefulWidget {
  const Question2({super.key});

  @override
  State<Question2> createState() => _Question2State();
}

class _Question2State extends State<Question2> {
  Question2Enum _question2 = Question2Enum.strongly_agree;
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
              index: 2,
            ),
            SizedBox(
              height: 25,
            ),
            FormTitle(
                formTitle:
                    "You spend a lot of time exploring topics that pique your interest"),
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
                      child: RadioListTile<Question2Enum>(
                        groupValue: _question2,
                        activeColor: Colors.white,
                        onChanged: (Question2Enum? value) {
                          setState(() {
                            _question2 = value!;
                            _q1 = true;
                            _q2 = false;
                            _q3 = false;
                            _q4 = false;
                            _q5 = false;
                          });
                        },
                        title: Text(
                          'Strongly agree',
                          style: TextStyle(
                              color: _q1 ? Colors.white : Colors.black),
                        ),
                        value: Question2Enum.strongly_agree,
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
                      child: RadioListTile<Question2Enum>(
                        groupValue: _question2,
                        activeColor: Colors.white,
                        onChanged: (Question2Enum? value) {
                          setState(() {
                            _question2 = value!;
                            _q1 = false;
                            _q2 = true;
                            _q3 = false;
                            _q4 = false;
                            _q5 = false;
                          });
                        },
                        title: Text(
                          'Agree',
                          style: TextStyle(
                              color: _q2 ? Colors.white : Colors.black),
                        ),
                        value: Question2Enum.agree,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          color: _q3 ? Colors.black : Colors.white),
                      child: RadioListTile<Question2Enum>(
                        groupValue: _question2,
                        activeColor: Colors.white,
                        onChanged: (Question2Enum? value) {
                          setState(() {
                            _question2 = value!;
                            _q1 = false;
                            _q2 = false;
                            _q3 = true;
                            _q4 = false;
                            _q5 = false;
                          });
                        },
                        title: Text(
                          'Neutral',
                          style: TextStyle(
                              color: _q3 ? Colors.white : Colors.black),
                        ),
                        value: Question2Enum.neutral,
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
                      child: RadioListTile<Question2Enum>(
                        groupValue: _question2,
                        activeColor: Colors.white,
                        onChanged: (Question2Enum? value) {
                          setState(() {
                            _question2 = value!;
                            _q1 = false;
                            _q2 = false;
                            _q3 = false;
                            _q4 = true;
                            _q5 = false;
                          });
                        },
                        title: Text(
                          'Disagree',
                          style: TextStyle(
                              color: _q4 ? Colors.white : Colors.black),
                        ),
                        value: Question2Enum.disagree,
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
                      child: RadioListTile<Question2Enum>(
                        groupValue: _question2,
                        activeColor: Colors.white,
                        onChanged: (Question2Enum? value) {
                          setState(() {
                            _question2 = value!;
                            _q1 = false;
                            _q2 = false;
                            _q3 = false;
                            _q4 = false;
                            _q5 = true;
                          });
                        },
                        title: Text(
                          'Strongly disagree',
                          style: TextStyle(
                              color: _q5 ? Colors.white : Colors.black),
                        ),
                        value: Question2Enum.strongly_disagree,
                      ),
                    ),
                  ],
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
                                builder: ((context) => const Question3())));
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

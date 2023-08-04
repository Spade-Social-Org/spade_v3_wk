import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/question_progress.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding_questions/religion_question.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/questions_enum.dart';

class Question5 extends StatefulWidget {
  const Question5({super.key});

  @override
  State<Question5> createState() => _Question5State();
}

class _Question5State extends State<Question5> {
  Question3Enum _question5 = Question3Enum.strongly_agree;
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
              index: 5,
            ),
            SizedBox(
              height: 25,
            ),
            FormTitle(
                formTitle: "You usually stay calm under a lot of pressure"),
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
                      child: RadioListTile<Question3Enum>(
                        groupValue: _question5,
                        activeColor: Colors.white,
                        onChanged: (Question3Enum? value) {
                          setState(() {
                            _question5 = value!;
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
                        value: Question3Enum.strongly_agree,
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
                      child: RadioListTile<Question3Enum>(
                        groupValue: _question5,
                        activeColor: Colors.white,
                        onChanged: (Question3Enum? value) {
                          setState(() {
                            _question5 = value!;
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
                        value: Question3Enum.agree,
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
                      child: RadioListTile<Question3Enum>(
                        groupValue: _question5,
                        activeColor: Colors.white,
                        onChanged: (Question3Enum? value) {
                          setState(() {
                            _question5 = value!;
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
                        value: Question3Enum.neutral,
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
                      child: RadioListTile<Question3Enum>(
                        groupValue: _question5,
                        activeColor: Colors.white,
                        onChanged: (Question3Enum? value) {
                          setState(() {
                            _question5 = value!;
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
                        value: Question3Enum.disagree,
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
                      child: RadioListTile<Question3Enum>(
                        groupValue: _question5,
                        activeColor: Colors.white,
                        onChanged: (Question3Enum? value) {
                          setState(() {
                            _question5 = value!;
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
                        value: Question3Enum.strongly_disagree,
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
                                builder: ((context) => const ReligionQuestion())));
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

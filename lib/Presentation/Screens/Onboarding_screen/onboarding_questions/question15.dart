import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/question_progress.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding_questions/question16.dart';

class Question15 extends StatefulWidget {
  const Question15({super.key});

  @override
  State<Question15> createState() => _Question15State();
}

class _Question15State extends State<Question15> {
  String groupValue = "A romantic week.";
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
              index: 15,
            ),
            SizedBox(
              height: 25,
            ),
            FormTitle(
                formTitle: "What kind of travel do you prefer with your partner?"),
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
                          "A romantic week.",
                          style: TextStyle(
                              color: _q1 ? Colors.white : Colors.black),
                        ),
                        value: "A romantic week.",
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
                          'Spending comfortable time in a hotel',
                          style: TextStyle(
                              color: _q2 ? Colors.white : Colors.black),
                        ),
                        value: "Spending comfortable time in a hotel",
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
                          'A trip for shopping.',
                          style: TextStyle(
                              color: _q4 ? Colors.white : Colors.black),
                        ),
                        value: "A trip for shopping.",
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
                          'Away from the technology, only personal time.',
                          style: TextStyle(
                              color: _q5 ? Colors.white : Colors.black),
                        ),
                        value: "Away from the technology, only personal time.",
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
                      'A place to come closer.',
                      style:
                          TextStyle(color: _q3 ? Colors.white : Colors.black),
                    ),
                    value: "A place to come closer.",
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
                                builder: ((context) => const Question16())));
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

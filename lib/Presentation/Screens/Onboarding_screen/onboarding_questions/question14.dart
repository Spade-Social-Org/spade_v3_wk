import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/question_progress.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding_questions/question15.dart';

class Question14 extends StatefulWidget {
  const Question14({super.key});

  @override
  State<Question14> createState() => _Question14State();
}

class _Question14State extends State<Question14> {
   String groupValue = "Admire my abilities";
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
              index: 14,
            ),
            SizedBox(
              height: 25,
            ),
            FormTitle(
                formTitle: "You recently got a promotion. What do you expect from your partner?"),
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
                          "Admire my abilities",
                          style: TextStyle(
                              color: _q1 ? Colors.white : Colors.black),
                        ),
                        value: "Admire my abilities",
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
                          'Make dinner as a reward',
                          style: TextStyle(
                              color: _q2 ? Colors.white : Colors.black),
                        ),
                        value: "Make dinner as a reward",
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
                          'Organize a party for me.',
                          style: TextStyle(
                              color: _q4 ? Colors.white : Colors.black),
                        ),
                        value: "Organize a party for me.",
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
                          'Take me out to party',
                          style: TextStyle(
                              color: _q5 ? Colors.white : Colors.black),
                        ),
                        value: "Take me out to party",
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
                      'Invitation for dinner.',
                      style:
                          TextStyle(color: _q3 ? Colors.white : Colors.black),
                    ),
                    value: "Invitation for dinner.",
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
                                builder: ((context) => const Question15())));
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

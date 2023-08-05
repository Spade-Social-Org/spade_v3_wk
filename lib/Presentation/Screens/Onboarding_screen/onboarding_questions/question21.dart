import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/question_progress.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding_questions/question22.dart';

class Question21 extends StatefulWidget {
  const Question21({super.key});

  @override
  State<Question21> createState() => _Question21State();
}

class _Question21State extends State<Question21> {
  String groupValue =
      "Being taken out to a beautiful, luxurious restaurant, and theyfo ot the hole bill, even though they’re not exactly rich.";
  bool _q1 = true;
  bool _q2 = false;
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
              index: 21,
            ),
            SizedBox(
              height: 25,
            ),
            FormTitle(
                formTitle:
                    "You think you’ve sprained your ankle. How can your partner best help you out?"),
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
                          });
                        },
                        title: Text(
                          "Being taken out to a beautiful, luxurious restaurant, and theyfo ot the hole bill, even though they’re not exactly rich.",
                          style: TextStyle(
                              color: _q1 ? Colors.white : Colors.black),
                        ),
                        value:
                            "Being taken out to a beautiful, luxurious restaurant, and theyfo ot the hole bill, even though they’re not exactly rich.",
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
                          });
                        },
                        title: Text(
                          "Receiving a long, handwritten card from your partner about everything they love about you",
                          style: TextStyle(
                              color: _q2 ? Colors.white : Colors.black),
                        ),
                        value:
                            "Receiving a long, handwritten card from your partner about everything they love about you",
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
                                builder: ((context) => const Question22())));
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

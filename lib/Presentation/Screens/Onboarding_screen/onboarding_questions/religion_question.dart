import 'package:flutter/material.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/form_title.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding%20widgets/question_progress.dart';
import 'package:spade_v4/Presentation/Screens/Onboarding_screen/onboarding_questions/birthday.dart';

class ReligionQuestion extends StatefulWidget {
  const ReligionQuestion({super.key});

  @override
  State<ReligionQuestion> createState() => _ReligionQuestionState();
}

class _ReligionQuestionState extends State<ReligionQuestion> {
  bool christian = false;
  bool hindi = false;
  bool sikhism = false;
  bool folkReligion = false;
  bool juda = false;
  bool budda = false;
  bool irreligion = false;
  bool atheist = false;
  bool islam = false;
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
              child: FormTitle(formTitle: "What’s your religion?"),
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              christian = true;
                              hindi = false;
                              sikhism = false;
                              folkReligion = false;
                              juda = false;
                              budda = false;
                              irreligion = false;
                              atheist = false;
                              islam = false;
                            });
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: !christian
                                        ? Colors.white
                                        : Colors.black),
                                child: Text(
                                  "Christianity",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: christian
                                          ? Colors.white
                                          : Colors.black),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              hindi = true;
                              christian = false;
                              sikhism = false;
                              folkReligion = false;
                              juda = false;
                              budda = false;
                              irreligion = false;
                              atheist = false;
                              islam = false;
                            });
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        !hindi ? Colors.white : Colors.black),
                                child: Text(
                                  "Hinduism",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          hindi ? Colors.white : Colors.black),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              sikhism = true;
                              hindi = false;
                              christian = false;
                              folkReligion = false;
                              juda = false;
                              budda = false;
                              irreligion = false;
                              atheist = false;
                              islam = false;
                            });
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        !sikhism ? Colors.white : Colors.black),
                                child: Text(
                                  "Sikhisim",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: sikhism
                                          ? Colors.white
                                          : Colors.black),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              folkReligion = true;
                              sikhism = false;
                              hindi = false;
                              christian = false;
                              juda = false;
                              budda = false;
                              irreligion = false;
                              atheist = false;
                              islam = false;
                            });
                          },
                          child: Card(
                              elevation: 5,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: !folkReligion
                                        ? Colors.white
                                        : Colors.black),
                                child: Text(
                                  "Folk Religon",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: folkReligion
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              juda = true;
                              folkReligion = false;
                              sikhism = false;
                              hindi = false;
                              christian = false;
                              budda = false;
                              irreligion = false;
                              atheist = false;
                              islam = false;
                            });
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: !juda ? Colors.white : Colors.black),
                                child: Text(
                                  "Judaism",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          juda ? Colors.white : Colors.black),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              budda = true;
                              juda = false;
                              folkReligion = false;
                              sikhism = false;
                              hindi = false;
                              christian = false;
                              irreligion = false;
                              atheist = false;
                              islam = false;
                            });
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        !budda ? Colors.white : Colors.black),
                                child: Text(
                                  "Buddhism",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          budda ? Colors.white : Colors.black),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              irreligion = true;
                              budda = false;
                              juda = false;
                              folkReligion = false;
                              sikhism = false;
                              hindi = false;
                              christian = false;
                              atheist = false;
                              islam = false;
                            });
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: !irreligion
                                        ? Colors.white
                                        : Colors.black),
                                child: Text(
                                  "Irreligion",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: irreligion
                                          ? Colors.white
                                          : Colors.black),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              atheist = true;
                              irreligion = false;
                              budda = false;
                              juda = false;
                              folkReligion = false;
                              sikhism = false;
                              hindi = false;
                              christian = false;
                              islam = false;
                            });
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        !atheist ? Colors.white : Colors.black),
                                child: Text(
                                  "Atheist",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: atheist
                                          ? Colors.white
                                          : Colors.black),
                                )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              islam = true;
                              atheist = false;
                              irreligion = false;
                              budda = false;
                              juda = false;
                              folkReligion = false;
                              sikhism = false;
                              hindi = false;
                              christian = false;
                            });
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        !islam ? Colors.white : Colors.black),
                                child: Text(
                                  "Islam",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          islam ? Colors.white : Colors.black),
                                )),
                          ),
                        ),
                      ],
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
                                builder: ((context) =>
                                    const BirthdayQuestion())));
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

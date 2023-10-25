import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:spade_v4/Presentation/Screens/Discover/widgets/custom_fonts.dart';
import 'package:spade_v4/Presentation/Screens/Discover/widgets/spacer.dart';

class CompatabilityViewMain extends StatefulWidget {
  const CompatabilityViewMain({super.key});

  @override
  State<CompatabilityViewMain> createState() => _CompatabilityViewMainState();
}

class _CompatabilityViewMainState extends State<CompatabilityViewMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                heightSpace(5),
                customText(
                  text: 'Activities Analysis',
                  fontSize: 14,
                  textColor: Colors.black87,
                  fontWeight: FontWeight.w700,
                ),
                heightSpace(25),
                CircularPercentIndicator(
                  backgroundColor: Colors.grey.shade200,
                  radius: 60,
                  lineWidth: 18.0,
                  percent: 0.6,
                  center: const Text(
                    "60%",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                  progressColor: Colors.red,
                ),
                heightSpace(25),
                customText(
                  text:
                      'Having shared interests and activities can lead to enjoyable experiences together.',
                  fontSize: 12,
                  textColor: Colors.black54,
                  fontWeight: FontWeight.w400,
                  lines: 2,
                  textAlignment: TextAlign.center,
                ),
                heightSpace(25),
                customText(
                  text:
                      "Here's a breakdown of your compatibility in various activities",
                  fontSize: 12,
                  textColor: Colors.black87,
                  fontWeight: FontWeight.w600,
                  lines: 2,
                  textAlignment: TextAlign.center,
                ),
              ],
            ),
          ),
          heightSpace(25),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffA12718).withOpacity(0.15),
              ),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                text: 'Travel',
                                fontSize: 14,
                                textColor: Colors.black87,
                                fontWeight: FontWeight.w700,
                              ),
                              heightSpace(5),
                              customText(
                                text:
                                    'Travel You both scored 50% While there are some differences in travel preferences, you can plan trips that cater to both your interests',
                                fontSize: 12,
                                textColor: Colors.black87,
                                fontWeight: FontWeight.w500,
                                lines: 3,
                                textAlignment: TextAlign.left,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

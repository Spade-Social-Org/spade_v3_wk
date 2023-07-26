import 'package:flutter/material.dart';
import '../../widgets/calender_widget.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/map2.jfif",
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            // Close the dialog when tapping outside the content
            onTap: () {
              Navigator.of(context).pop();
            },
            child: DraggableScrollableSheet(
              initialChildSize: 0.6, // Initial size of the dialog
              minChildSize: 0.1, // Minimum size of the dialog
              maxChildSize: 0.6, // Maximum size of the dialog
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      const Divider(
                        endIndent: 150,
                        indent: 150,
                        thickness: 10,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Text(
                              "Twisted Root Burger co",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      const CalenderWidget(),
                      Padding(
                          padding: const EdgeInsets.only(left: 90, right: 90),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const ScheduleScreen(),
                                //   ),
                                // );
                              },
                              child: Container(
                                color: Colors.white,
                                height: 50,
                                child: const Center(
                                    child: Text(
                                      "Next",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                              ),
                            ),
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



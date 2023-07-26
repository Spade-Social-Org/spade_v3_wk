import 'package:flutter/material.dart';

class SetDateScreen extends StatelessWidget {
  const SetDateScreen({super.key});

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
              initialChildSize: 0.7, // Initial size of the dialog
              minChildSize: 0.1, // Minimum size of the dialog
              maxChildSize: 0.7, // Maximum size of the dialog
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      const Center(
                          child: Text(
                            "The Date is set!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 400,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 80,
                              bottom: 5,
                              child: Transform.rotate(
                                angle: -0.2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    height: 250,
                                    width: 150,
                                    color: Colors.white,
                                    child:
                                    Image.asset("assets/iamges/Image 40.png"),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 70,
                              top: 10,
                              child: Transform.rotate(

                                angle: 0.2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    height: 250,
                                    width: 150,
                                    color: Colors.white,
                                    child: Image.asset(
                                      "assets/images/Rectangle 1595.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Center(
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.favorite,
                                  color: Color(0xFF155332),
                                  size: 50,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80, right: 80),
                        child: MaterialButton(
                          height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colors.white,
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> const InviteScreen()));
                          },
                          child: const Text(
                            "View Calender Date",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
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

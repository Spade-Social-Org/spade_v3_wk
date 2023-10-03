import 'package:flutter/material.dart';



class HeightSelectionWomenScreen extends StatefulWidget {
  const HeightSelectionWomenScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HeightSelectionWomenScreenState createState() =>
      _HeightSelectionWomenScreenState();
}

class _HeightSelectionWomenScreenState
    extends State<HeightSelectionWomenScreen> {
  double _currentHeight = 170; // starting height

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                  right: 90,
                  bottom: 0,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200, bottom: 10),
                    child: SizedBox(
                      height: 300,
                      width: 50,
                      child: Image.asset(
                        "assets/images/Component 1 (1).png",
                      ),
                    ),
                  )),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 18,
                      top: 30,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Center(
                    child: Text(
                      "What's your height ?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 450,
                        width: 200,
                        child: Image.asset(
                            "assets/images/freepik--character-3--inject-11 (1).png"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '${_currentHeight.round()}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Draggable(
                        axis: Axis.vertical,
                        feedback: Container(
                          height: 200,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onDragUpdate: (DragUpdateDetails details) {
                          setState(() {
                            _currentHeight -= details.delta.dy;
                          });
                        },
                        child: Container(
                          height: 10,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ClipRRect(
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
                            builder: ((context) => const InputBodyBuildWomenScreen())));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class JHMatchWidget extends StatelessWidget {
  const JHMatchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF155332),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      height: screenHeight * 0.55,
      width: screenWidth * 0.86,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 120,
                                width: 100,
                                color: Colors.grey,
                                child: Image.asset(
                                  "assets/images/Image 40.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Text(
                              "You",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/cake.png"),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "26",
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/timer.png"),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Night",
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/mdi_zodiac-leo.png"),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Leo",
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/ruler.png"),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "5'11",
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/weight.png"),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Athletic",
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/Location_Icon_UIA.png"),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Addison",
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset("assets/images/bi_gender-male.png"),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Straight",
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 120,
                            width: 100,
                            color: Colors.red,
                            child: Image.asset(
                              "assets/images/Rectangle 1595.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          "Maria",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/cake.png"),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "24",
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/timer.png"),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Night",
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                            "assets/images/icon-park-outline_virgo.png"),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Virgo",
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/ruler.png"),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "51",
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/weight.png"),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Slim",
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/Location_Icon_UIA.png"),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "4.3ml",
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/bi_gender-male.png"),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "Straight",
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 100,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (contex, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      height: 30,
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "My unpopular opininon.....",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 140, 135, 135)),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                                size: 18,
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}




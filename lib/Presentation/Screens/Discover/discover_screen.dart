import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:spade_v4/Data/Models/discover.dart';
import 'package:spade_v4/Data/Models/discover_service.dart';
import 'package:spade_v4/Presentation/widgets/jh_compatibility_widget.dart';
import 'package:spade_v4/Presentation/widgets/jh_match_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

bool toggle = true;

// class Content {
//   final String name;
//   final Color color;
//   final String urlImg;
//   final String age;
//   final String country;
//   final String percentage;
//
//   Content(this.name, this.color, this.urlImg, this.age, this.country,
//       this.percentage);
// }

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen>
    with SingleTickerProviderStateMixin {
// final Discover_Model _discover_model;
  int currentCardIndex = 0;
  bool displayMatch = false;
  bool displayCompatibility = false;
  String modalType = "";
  final CardSwiperController controller = CardSwiperController();
  late AnimationController _controller;
  int expandedButtonIndex = -1;
  // List<dynamic> jsonData = [];
  //  List persons = [];
  late List<DiscoverModel> persons;
  String myZone = 'all';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 275),
    );

    getDisc();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Alignment alignment = const Alignment(00, 00);
  Alignment alignment1 = const Alignment(00, 00);
  Alignment alignment2 = const Alignment(00, 00);
  Alignment alignment3 = const Alignment(00, 00);
  Alignment alignment4 = const Alignment(00, 00);
  Alignment alignment5 = const Alignment(00, 00);
  Alignment alignment6 = const Alignment(00, 00);

  double size1 = 50;
  double size2 = 50;
  double size3 = 50;
  double size4 = 50;
  double size5 = 50;
  double size6 = 50;

  void expandedButton(int index) {
    setState(() {
      if (expandedButtonIndex == index) {
        expandedButtonIndex = -1;
      } else {
        expandedButtonIndex = index;
      }
    });
  }

  void changeOptionModal(String name) {
    setState(() {
      if (modalType == name) {
        modalType = "";
      } else {
        modalType = name;
      }
    });
  }

  void getDisc() {
    switch (myZone) {
      case 'all':
        persons = [
          DiscoverModel(
            "Jane",
            const Color.fromARGB(255, 37, 140, 42),
            "assets/images/Rectangle 1598.png",
            "20",
            'United State 🇺🇸',
            "100",
          ),
          DiscoverModel(
            "Paul",
            const Color.fromARGB(255, 37, 140, 42),
            "assets/images/Rectangle 1597.png",
            "20",
            'United State  🇺🇸',
            "80",
          ),
          DiscoverModel(
              "Mike",
              const Color.fromARGB(255, 148, 17, 8),
              "assets/images/Rectangle 1595.png",
              "20",
              'United State  🇺🇸',
              "50"),
          DiscoverModel("John", const Color.fromARGB(255, 204, 167, 1),
              "assets/images/Screenshot.png", "20", 'United State  🇺🇸', "45"),
          DiscoverModel(
              "Jane",
              const Color.fromARGB(255, 37, 140, 42),
              "assets/images/Rectangle 1598.png",
              "20",
              'United State  🇺🇸',
              "60"),
          DiscoverModel(
              "Paul",
              const Color.fromARGB(255, 37, 140, 42),
              "assets/images/Rectangle 1597.png",
              "20",
              'United State  🇺🇸',
              "55"),
          DiscoverModel(
              "Mike",
              const Color.fromARGB(255, 148, 17, 8),
              "assets/images/Rectangle 1595.png",
              "20",
              'United State  🇺🇸',
              "90"),
          DiscoverModel("John", const Color.fromARGB(255, 204, 167, 1),
              "assets/images/Screenshot.png", "20", 'United State  🇺🇸', "60"),
        ];
        break;
      case 'red':
        persons = [
          DiscoverModel(
            "Jane",
            const Color.fromARGB(255, 148, 17, 8),
            "assets/images/Rectangle 1598.png",
            "20",
            'United State',
            "100",
          ),
          DiscoverModel(
            "Paul",
            const Color.fromARGB(255, 148, 17, 8),
            "assets/images/Rectangle 1597.png",
            "20",
            'United State',
            "80",
          ),
          DiscoverModel("Mike", const Color.fromARGB(255, 148, 17, 8),
              "assets/images/Rectangle 1595.png", "20", 'United State', "50"),
          DiscoverModel("John", const Color.fromARGB(255, 148, 17, 8),
              "assets/images/Screenshot.png", "20", 'United State', "45"),
          DiscoverModel("Jane", const Color.fromARGB(255, 148, 17, 8),
              "assets/images/Rectangle 1598.png", "20", 'United State', "60"),
          DiscoverModel("Paul", const Color.fromARGB(255, 148, 17, 8),
              "assets/images/Rectangle 1597.png", "20", 'United State', "55"),
          DiscoverModel("Mike", const Color.fromARGB(255, 148, 17, 8),
              "assets/images/Rectangle 1595.png", "20", 'United State', "90"),
          DiscoverModel("John", const Color.fromARGB(255, 148, 17, 8),
              "assets/images/Screenshot.png", "20", 'United State', "60"),
        ];
        break;
      case 'yellow':
        persons = [
          DiscoverModel(
            "Jane",
            const Color.fromARGB(255, 204, 167, 1),
            "assets/images/Rectangle 1598.png",
            "20",
            'United State',
            "100",
          ),
          DiscoverModel(
            "Paul",
            const Color.fromARGB(255, 204, 167, 1),
            "assets/images/Rectangle 1597.png",
            "20",
            'United State',
            "80",
          ),
          DiscoverModel("Mike", const Color.fromARGB(255, 204, 167, 1),
              "assets/images/Rectangle 1595.png", "20", 'United State', "50"),
          DiscoverModel("John", const Color.fromARGB(255, 204, 167, 1),
              "assets/images/Screenshot.png", "20", 'United State', "45"),
          DiscoverModel("Jane", const Color.fromARGB(255, 204, 167, 1),
              "assets/images/Rectangle 1598.png", "20", 'United State', "60"),
          DiscoverModel("Paul", const Color.fromARGB(255, 204, 167, 1),
              "assets/images/Rectangle 1597.png", "20", 'United State', "55"),
          DiscoverModel("Mike", const Color.fromARGB(255, 204, 167, 1),
              "assets/images/Rectangle 1595.png", "20", 'United State', "90"),
          DiscoverModel("John", const Color.fromARGB(255, 204, 167, 1),
              "assets/images/Screenshot.png", "20", 'United State', "60"),
        ];
        break;
      case 'green':
        persons = [
          DiscoverModel(
            "Jane",
            const Color.fromARGB(255, 37, 140, 42),
            "assets/images/Rectangle 1598.png",
            "20",
            'United State',
            "100",
          ),
          DiscoverModel(
            "Paul",
            const Color.fromARGB(255, 37, 140, 42),
            "assets/images/Rectangle 1597.png",
            "20",
            'United State',
            "80",
          ),
          DiscoverModel("Mike", const Color.fromARGB(255, 37, 140, 42),
              "assets/images/Rectangle 1595.png", "20", 'United State', "50"),
          DiscoverModel("John", const Color.fromARGB(255, 37, 140, 42),
              "assets/images/Screenshot.png", "20", 'United State', "45"),
          DiscoverModel("Jane", const Color.fromARGB(255, 37, 140, 42),
              "assets/images/Rectangle 1598.png", "20", 'United State', "60"),
          DiscoverModel("Paul", const Color.fromARGB(255, 37, 140, 42),
              "assets/images/Rectangle 1597.png", "20", 'United State', "55"),
          DiscoverModel("Mike", const Color.fromARGB(255, 37, 140, 42),
              "assets/images/Rectangle 1595.png", "20", 'United State', "90"),
          DiscoverModel("John", const Color.fromARGB(255, 37, 140, 42),
              "assets/images/Screenshot.png", "20", 'United State', "60"),
        ];
        break;
      case 'grey':
        persons = [
          DiscoverModel(
            "Jane",
            const Color.fromARGB(255, 176, 176, 176),
            "assets/images/Rectangle 1598.png",
            "20",
            'United State',
            "100",
          ),
          DiscoverModel(
            "Paul",
            const Color.fromARGB(255, 176, 176, 176),
            "assets/images/Rectangle 1597.png",
            "20",
            'United State',
            "80",
          ),
          DiscoverModel("Mike", const Color.fromARGB(255, 176, 176, 176),
              "assets/images/Rectangle 1595.png", "20", 'United State', "50"),
          DiscoverModel("John", const Color.fromARGB(255, 176, 176, 176),
              "assets/images/Screenshot.png", "20", 'United State', "45"),
          DiscoverModel("Jane", const Color.fromARGB(255, 176, 176, 176),
              "assets/images/Rectangle 1598.png", "20", 'United State', "60"),
          DiscoverModel("Paul", const Color.fromARGB(255, 176, 176, 176),
              "assets/images/Rectangle 1597.png", "20", 'United State', "55"),
          DiscoverModel("Mike", const Color.fromARGB(255, 176, 176, 176),
              "assets/images/Rectangle 1595.png", "20", 'United State', "90"),
          DiscoverModel("John", const Color.fromARGB(255, 176, 176, 176),
              "assets/images/Screenshot.png", "20", 'United State', "60"),
        ];
        break;
      default:
        persons = [
          DiscoverModel(
            "Jane",
            const Color.fromARGB(255, 37, 140, 42),
            "assets/images/Rectangle 1598.png",
            "20",
            'United State',
            "100",
          ),
          DiscoverModel(
            "Paul",
            const Color.fromARGB(255, 37, 140, 42),
            "assets/images/Rectangle 1597.png",
            "20",
            'United State',
            "80",
          ),
          DiscoverModel("Mike", const Color.fromARGB(255, 148, 17, 8),
              "assets/images/Rectangle 1595.png", "20", 'United State', "50"),
          DiscoverModel("John", const Color.fromARGB(255, 204, 167, 1),
              "assets/images/Screenshot.png", "20", 'United State', "45"),
          DiscoverModel("Jane", const Color.fromARGB(255, 37, 140, 42),
              "assets/images/Rectangle 1598.png", "20", 'United State', "60"),
          DiscoverModel("Paul", const Color.fromARGB(255, 37, 140, 42),
              "assets/images/Rectangle 1597.png", "20", 'United State', "55"),
          DiscoverModel("Mike", const Color.fromARGB(255, 148, 17, 8),
              "assets/images/Rectangle 1595.png", "20", 'United State', "90"),
          DiscoverModel("John", const Color.fromARGB(255, 204, 167, 1),
              "assets/images/Screenshot.png", "20", 'United State', "60"),
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    SystemUiOverlayStyle customStatusBarStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.07),
          child: Container(
            padding:
                const EdgeInsets.only(top: 5, left: 5), // Set padding to zero
            child: AppBar(
              // backgroundColor: Colors.transparent,
              // Set the height of the AppBar
              toolbarOpacity: 1,
              leading: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5.0),
                    width: 55,
                    height: 55,
                    child: const CircleAvatar(
                      radius: 30.0, // Set the radius of the circle
                      backgroundImage:
                          AssetImage('assets/images/Rectangle 1598.png'),
                    ),
                  ),
                ],
              ),
              elevation: 0.0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              title: const Text(
                'Discover',
                // style: ,
              ),
              centerTitle: true,

              actions: [
                Row(
                  children: [
                    Container(
                      width: 35,
                      height: 40,
                      // color: Colors.red,
                      child: IconButton(
                        icon: const Icon(Icons.notification_add_outlined),
                        onPressed: () {
                          // Handle search action
                        },
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      // color: Colors.red,
                      child: IconButton(
                        icon: const Icon(
                          Icons.more_vert_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Handle search action
                        },
                      ),
                    ),
                  ],
                )
              ],
              // Other app bar properties and actions
            ),
          ),
        ),
        body: Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Stack(alignment: AlignmentDirectional.center, children: [
                CardSwiper(
                    controller: controller,
                    cardsCount: persons.length,
                    duration: const Duration(milliseconds: 200),
                    direction: CardSwiperDirection.right,
                    allowedSwipeDirection: AllowedSwipeDirection.only(
                        left: true, right: true, up: false, down: false),
                    onSwipe: _onSwipe,
                    maxAngle: 60,
                    onUndo: _onUndo,
                    numberOfCardsDisplayed: 3,
                    backCardOffset: const Offset(20, -35),
                    padding: const EdgeInsets.all(5.0),
                    cardBuilder: (
                      context,
                      index,
                      horizontalThresholdPercentage,
                      verticalThresholdPercentage,
                    ) =>
                        Container(
                            height: screenHeight * 0.60,
                            child: Transform.scale(
                              scale: 0.9,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  // color: persons[index].color,
                                  decoration: BoxDecoration(
                                    // color: Colors.blue,
                                    border: Border.all(
                                      color: persons[index].color,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(25),

                                    image: DecorationImage(
                                        image:
                                            AssetImage(persons[index].urlImg),
                                        fit: BoxFit.cover),
                                    color: Colors.grey,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              persons[index].name,
                                              // "Ade",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              persons[index].age,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            padding: const EdgeInsets.all(9),
                                            color: Colors.white38,
                                            child: Text(
                                              persons[index].country,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ))),
                Positioned(
                  top: 30,
                  left: 20,
                  right: 25,
                  child: Container(
                    height: screenHeight * 0.54,
                    child: Visibility(
                      visible: modalType == "match" ? true : false,
                      child: JHMatchWidget(
                          name: "${persons[currentCardIndex].name}",
                          image: "${persons[currentCardIndex].urlImg}",
                          age: persons[currentCardIndex].age,
                          color: persons[currentCardIndex].color),
                    ),
                  ),
                ),
                Positioned(
                  top: 28,
                  left: 20,
                  right: 25,
                  child: Container(
                    height: screenHeight * 0.57,
                    child: Visibility(
                      // visible: displayCompatibility,
                      visible: modalType == "compatibility" ? true : false,
                      child: JHCompatibilityWidget(
                          image: persons[currentCardIndex].urlImg),
                      // child: JHMatchWidget(name: "${persons[currentCardIndex].name}", image: "${persons[currentCardIndex].urlImg}", age: persons[currentCardIndex].age, color:persons[currentCardIndex].color),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
        floatingActionButton: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.loose,
          children: [
            Positioned(
              bottom: toggle ? -20 : -30,
              left: screenWidth * 0.2,
              right: screenWidth * 0.2,
              child: SizedBox(
                height: screenHeight * 0.3,
                width: screenWidth * 1,
                child: Stack(
                  children: [
                    AnimatedAlign(
                      duration: toggle
                          ? const Duration(milliseconds: 100)
                          : const Duration(milliseconds: 875),
                      alignment: alignment1,
                      curve: toggle ? Curves.easeIn : Curves.elasticInOut,
                      //Compability-button
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: toggle ? Curves.easeIn : Curves.easeIn,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: GestureDetector(
                              onTap: () {
                                expandedButton(1);
                                changeOptionModal("compatibility");
                              },
                              child: Container(
                                height: expandedButtonIndex == 1 ? 50 : 35,
                                width: expandedButtonIndex == 1 ? 50 : 35,
                                color: persons[currentCardIndex].color,
                                child: Image.asset("assets/images/temp.png"),
                              ),
                            )),
                      ),
                    ),
                    //dislike
                    AnimatedAlign(
                      duration: toggle
                          ? const Duration(milliseconds: 100)
                          : const Duration(milliseconds: 875),
                      alignment: alignment2,
                      curve: toggle ? Curves.easeIn : Curves.elasticInOut,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: toggle ? Curves.easeIn : Curves.easeIn,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: GestureDetector(
                              onTap: () {
                                expandedButton(2);
                                controller.swipeLeft();
                              },
                              child: Container(
                                height: expandedButtonIndex == 2 ? 40 : 40,
                                width: expandedButtonIndex == 2 ? 40 : 40,
                                color: Colors.grey,
                                child: Image.asset("assets/images/Vector.png"),
                              ),
                            )),
                      ),
                    ),

                    //Love
                    AnimatedAlign(
                      duration: toggle
                          ? const Duration(milliseconds: 100)
                          : const Duration(milliseconds: 875),
                      alignment: alignment3,
                      curve: toggle ? Curves.easeIn : Curves.elasticInOut,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: toggle ? Curves.easeIn : Curves.easeIn,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: GestureDetector(
                            onTap: () {
                              expandedButton(3);
                              controller.swipeRight();
                            },
                            child: Container(
                              height: expandedButtonIndex == 3 ? 40 : 40,
                              width: expandedButtonIndex == 3 ? 40 : 40,
                              color: Colors.red,
                              child: Image.asset("assets/images/heart.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Match
                    AnimatedAlign(
                      duration: toggle
                          ? const Duration(milliseconds: 100)
                          : const Duration(milliseconds: 875),
                      alignment: alignment4,
                      curve: toggle ? Curves.easeIn : Curves.elasticInOut,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: toggle ? Curves.easeIn : Curves.easeIn,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: GestureDetector(
                              onTap: () {
                                expandedButton(4);
                                changeOptionModal("match");
                              },
                              child: Container(
                                height: expandedButtonIndex == 4 ? 50 : 35,
                                width: expandedButtonIndex == 4 ? 50 : 35,
                                color: persons[currentCardIndex].color,
                                child: Image.asset(
                                  "assets/images/match image.png",
                                  // height: 30,
                                  // width: 30,
                                  // fit: BoxFit.contain,
                                ),
                              ),
                            )),
                      ),
                    ),
                    //3cards
                    AnimatedAlign(
                      duration: toggle
                          ? const Duration(milliseconds: 100)
                          : const Duration(milliseconds: 875),
                      alignment: alignment5,
                      curve: toggle ? Curves.easeIn : Curves.elasticInOut,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: toggle ? Curves.easeIn : Curves.easeIn,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: GestureDetector(
                              onTap: () {
                                expandedButton(5);
                              },
                              child: Container(
                                height: expandedButtonIndex == 5 ? 40 : 35,
                                width: expandedButtonIndex == 5 ? 40 : 35,
                                color: persons[currentCardIndex].color,
                                child: Image.asset("assets/images/3cards.png"),
                              ),
                            )),
                      ),
                    ),
                    //new
                    AnimatedAlign(
                      duration: toggle
                          ? const Duration(milliseconds: 100)
                          : const Duration(milliseconds: 875),
                      alignment: alignment6,
                      curve: toggle ? Curves.easeIn : Curves.elasticInOut,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: toggle ? Curves.easeIn : Curves.easeIn,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: GestureDetector(
                              onTap: () {
                                expandedButton(5);
                              },
                              child: Container(
                                height: expandedButtonIndex == 5 ? 40 : 35,
                                width: expandedButtonIndex == 5 ? 40 : 35,
                                color: persons[currentCardIndex].color,
                                child: Image.asset(
                                    "assets/images/u-location-arrow.png"),
                              ),
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (toggle) {
                              toggle = !toggle;
                              _controller.forward();
                              Future.delayed(const Duration(milliseconds: 10),
                                  () {
                                alignment1 = const Alignment(-0.4, -0.5);
                              });
                              Future.delayed(const Duration(milliseconds: 10),
                                  () {
                                alignment2 = const Alignment(-0.6, 0.0);
                              });
                              //Love
                              Future.delayed(const Duration(milliseconds: 10),
                                  () {
                                alignment3 = const Alignment(0.6, 0.0);
                              });
                              //match
                              Future.delayed(const Duration(milliseconds: 10),
                                  () {
                                alignment4 = const Alignment(0.4, -0.5);
                              });
                              //3cards
                              Future.delayed(const Duration(milliseconds: 10),
                                  () {
                                alignment5 = const Alignment(0.4, 0.5);
                              });
                              //new
                              Future.delayed(const Duration(milliseconds: 10),
                                  () {
                                alignment6 = const Alignment(-0.4, 0.5);
                              });
                            } else {
                              toggle = !toggle;
                              _controller.reverse();
                              alignment1 = const Alignment(00, 00);
                              alignment2 = const Alignment(00, 00);
                              alignment3 = const Alignment(00, 00);
                              alignment4 = const Alignment(00, 00);
                              alignment5 = const Alignment(00, 00);
                              alignment6 = const Alignment(00, 00);
                            }
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: toggle ? 80 : 60,
                          width: toggle ? 80 : 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(3, 3),
                              ),
                            ],
                          ),
                          child: CircularPercentIndicator(
                            radius: toggle ? 28 : 18,
                            lineWidth: 5.0,
                            percent: (double.parse(
                                    persons[currentCardIndex].percentage) /
                                100),
                            center: Text(
                              "${persons[currentCardIndex].percentage}%",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                            ),
                            progressColor: persons[currentCardIndex].color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    setState(() {
      modalType = "";
      currentCardIndex = currentIndex!;
    });

    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    return true;
  }
}

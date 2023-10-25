import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:spade_v4/Data/Models/discover.dart';
import 'package:spade_v4/Presentation/Screens/Discover/assets/app_assets.dart';
import 'package:spade_v4/Presentation/Screens/Discover/widgets/compatability_view.dart';
import 'package:spade_v4/Presentation/Screens/Discover/widgets/custom_fonts.dart';
import 'package:spade_v4/Presentation/Screens/Discover/widgets/row_text_widget.dart';
import 'package:spade_v4/Presentation/Screens/Discover/widgets/spacer.dart';
import 'package:spade_v4/Presentation/widgets/jh_compatibility_widget.dart';
import 'package:spade_v4/Presentation/widgets/jh_match_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.07),
        child: Container(
          padding:
              const EdgeInsets.only(top: 10, left: 15), // Set padding to zero
          child: AppBar(
            // backgroundColor: Colors.transparent,
            // Set the height of the AppBar
            toolbarOpacity: 1,
            leading: const Row(
              children: [
                CircleAvatar(
                  radius: 20.0, // Set the radius of the circle
                  backgroundImage:
                      AssetImage('assets/images/Rectangle 1598.png'),
                ),
              ],
            ),
            elevation: 0.0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: customText(
              text: "Discover",
              fontSize: 20,
              textColor: Colors.black,
            ),
            centerTitle: true,

            actions: [
              Row(
                children: [
                  SvgPicture.asset(
                    DiscoveryImage.bell,
                    height: 25,
                    color: const Color(0xff818181),
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    // color: Colors.red,
                    child: IconButton(
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: Color(0xff818181),
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CardSwiper(
                    controller: controller,
                    cardsCount: persons.length,
                    duration: const Duration(milliseconds: 200),
                    direction: CardSwiperDirection.right,
                    allowedSwipeDirection: AllowedSwipeDirection.only(
                        left: true, right: true, up: false, down: false),
                    onSwipe: _onSwipe,
                    maxAngle: 75,
                    onUndo: _onUndo,
                    numberOfCardsDisplayed: 3,
                    backCardOffset: const Offset(25, -35),
                    padding: const EdgeInsets.all(5.0),
                    cardBuilder: (
                      context,
                      index,
                      horizontalThresholdPercentage,
                      verticalThresholdPercentage,
                    ) =>
                        FlipCard(
                      key: Key('flip$index'),
                      direction: FlipDirection.HORIZONTAL,
                      speed: 1000,
                      onFlipDone: (status) {
                        print(status);
                      },
                      front: Container(
                        width: double.infinity,
                        height: screenHeight * 0.58,
                        decoration: BoxDecoration(
                          color: persons[index].color,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: screenHeight * 0.58,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: persons[index].color,
                                      width: 3,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0)),
                                    //color: persons[index].color,
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage(persons[index].urlImg),
                                      fit: BoxFit.cover,
                                    ),
                                    //color: Colors.transparent,
                                  ),
                                ),
                                Positioned(
                                  left: 20,
                                  bottom: 20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          customText(
                                            text: persons[index].name,
                                            fontSize: 20,
                                            textColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          customText(
                                            text: persons[index].age,
                                            fontSize: 20,
                                            textColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          color: Colors.white38,
                                          child: customText(
                                            text: persons[index].country,
                                            fontSize: 16,
                                            textColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      heightSpace(10),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.place_outlined,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                          customText(
                                            text: "4.3 miles away",
                                            fontSize: 12,
                                            textColor: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ],
                                      ),
                                      heightSpace(10),
                                    ],
                                  ),
                                ),
                                const Positioned(
                                  bottom: 30,
                                  right: 20,
                                  child: Icon(Icons.autorenew,
                                      size: 30, color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      back: Container(
                        width: double.infinity,
                        height: screenHeight * 0.58,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: persons[index].color, width: 1.3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: screenHeight * 0.44,
                                width: screenWidth * 0.85,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: screenHeight * 0.12,
                                          width: screenWidth * 0.30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.cyan,
                                          ),
                                        ),
                                        heightSpace(10),
                                        customText(
                                          text: "You",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          textColor: Colors.black,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString: DiscoveryImage.cake,
                                              text: "26",
                                            ),
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString: DiscoveryImage.timer,
                                              text: "Night",
                                            ),
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString: DiscoveryImage.leo,
                                              text: "Leo",
                                            ),
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString: DiscoveryImage.ruler,
                                              text: "5'11",
                                            ),
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString:
                                                  DiscoveryImage.weight,
                                              text: "Athletic",
                                            ),
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString: DiscoveryImage.place,
                                              text: "Addison",
                                            ),
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString:
                                                  DiscoveryImage.gender,
                                              text: "Straight",
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    widthSpace(10),
                                    Container(
                                      height: screenHeight * 0.90,
                                      width: 2,
                                      color: Colors.black12,
                                    ),
                                    widthSpace(10),
                                    Column(
                                      children: [
                                        Container(
                                          height: screenHeight * 0.12,
                                          width: screenWidth * 0.30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.cyan,
                                          ),
                                        ),
                                        heightSpace(10),
                                        customText(
                                          text: "Maria",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          textColor: Colors.black,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString: DiscoveryImage.cake,
                                              text: "24",
                                            ),
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString: DiscoveryImage.timer,
                                              text: "Night",
                                            ),
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString: DiscoveryImage.virgo,
                                              text: "Virgo",
                                            ),
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString: DiscoveryImage.ruler,
                                              text: "5'1",
                                            ),
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString:
                                                  DiscoveryImage.weight,
                                              text: "Slim",
                                            ),
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString: DiscoveryImage.place,
                                              text: "4.3ml",
                                            ),
                                            heightSpace(10),
                                            const Page2RowTextWidget(
                                              imageString:
                                                  DiscoveryImage.gender,
                                              text: "Straight",
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16, bottom: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.grey)),
                                        height: 40,
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                "My unpopular opininon.....",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 140, 135, 135)),
                                              ),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.grey,
                                                  size: 20,
                                                ))
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 20,
                    right: 25,
                    child: SizedBox(
                      height: screenHeight * 0.54,
                      child: Visibility(
                        visible: modalType == "match" ? true : false,
                        child: JHMatchWidget(
                            name: persons[currentCardIndex].name,
                            image: persons[currentCardIndex].urlImg,
                            age: persons[currentCardIndex].age,
                            color: persons[currentCardIndex].color),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 28,
                    left: 20,
                    right: 25,
                    child: SizedBox(
                      height: screenHeight * 0.57,
                      child: Visibility(
                        // visible: displayCompatibility,
                        visible: modalType == "compatibility" ? true : false,
                        child: JHCompatibilityWidget(
                          image: persons[currentCardIndex].urlImg,
                        ),
                        // child: JHMatchWidget(name: "${persons[currentCardIndex].name}", image: "${persons[currentCardIndex].urlImg}", age: persons[currentCardIndex].age, color:persons[currentCardIndex].color),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 40),
        child: Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.loose,
          children: [
            Positioned(
              bottom: toggle ? -40 : -30,
              left: screenWidth * 0.2,
              right: screenWidth * 0.2,
              child: SizedBox(
                height: screenHeight * 0.29,
                width: screenWidth,
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
                                //changeOptionModal("compatibility");
                                Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  showMaterialModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => StatefulBuilder(
                                        builder: (BuildContext context,
                                            StateSetter state) {
                                      return ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                        child: Container(
                                          height: 700,
                                          color: Colors.white,
                                          child: const CompatabilityViewMain(),
                                        ),
                                      );
                                    }),
                                  );
                                  expandedButton(0);
                                });
                              },
                              child: Container(
                                height: expandedButtonIndex == 1 ? 60 : 40,
                                width: expandedButtonIndex == 1 ? 60 : 40,
                                color: persons[currentCardIndex].color,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    DiscoveryImage.temp,
                                  ),
                                ),
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
                                expandedButton(0);
                                controller.swipeLeft();
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                color: Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    DiscoveryImage.dislike,
                                  ),
                                ),
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
                              expandedButton(2);
                              controller.swipeRight();
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  DiscoveryImage.heart,
                                ),
                              ),
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
                                expandedButton(3);
                                changeOptionModal("match");
                                print("object");
                              },
                              child: Container(
                                height: expandedButtonIndex == 3 ? 60 : 40,
                                width: expandedButtonIndex == 3 ? 60 : 40,
                                color: persons[currentCardIndex].color,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(DiscoveryImage.flip),
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
                                expandedButton(4);
                              },
                              child: Container(
                                height: expandedButtonIndex == 4 ? 60 : 40,
                                width: expandedButtonIndex == 4 ? 60 : 40,
                                color: persons[currentCardIndex].color,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                      DiscoveryImage.threeCards),
                                ),
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
                                height: expandedButtonIndex == 5 ? 60 : 40,
                                width: expandedButtonIndex == 5 ? 60 : 40,
                                color: persons[currentCardIndex].color,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:
                                      SvgPicture.asset(DiscoveryImage.location),
                                ),
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
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            // Other widgets...

                            // FAB and CircularPercentIndicator should share the same alignment
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: toggle ? 90 : 65,
                              width: toggle ? 90 : 65,
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
                            ),

                            CircularPercentIndicator(
                              backgroundColor: const Color(0xff9A9A9A),
                              radius: toggle ? 33 : 23,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: true,
    );
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void expandedButton(int index) {
    setState(() {
      if (expandedButtonIndex == index) {
        expandedButtonIndex = -1;
      } else {
        expandedButtonIndex = index;
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



// child: AnimatedContainer(
//                           duration: const Duration(milliseconds: 300),
//                           height: toggle ? 90 : 65,
//                           width: toggle ? 90 : 65,
                          // decoration: BoxDecoration(
                          //   color: Colors.white,
                          //   borderRadius: BorderRadius.circular(50),
                          //   boxShadow: const [
                          //     BoxShadow(
                          //       color: Colors.grey,
                          //       blurRadius: 5,
                          //       offset: Offset(3, 3),
                          //     ),
                          //   ],
                          // ),
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 top: toggle ? screenHeight * 0.015 : 0.20,
//                                 left: toggle ? screenWidth * 0.032 : 0.40,
//                                 child: CircularPercentIndicator(
//                                   backgroundColor: const Color(0xff9A9A9A),
//                                   radius: toggle ? 33 : 23,
//                                   lineWidth: 5.0,
//                                   percent: (double.parse(
//                                           persons[currentCardIndex]
//                                               .percentage) /
//                                       100),
//                                   center: Text(
//                                     "${persons[currentCardIndex].percentage}%",
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 10),
//                                   ),
//                                   progressColor:
//                                       persons[currentCardIndex].color,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
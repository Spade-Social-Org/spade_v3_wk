import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}

// SizedBox(
//                             width: double.infinity,
//                             height: screenHeight * 0.60,
//                             child: Transform.scale(
//                               scale: 1,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(25.0),
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                     color: persons[index].color,
//                                     border: Border.all(
//                                       color: persons[index].color,
//                                       width: 2,
//                                     ),
//                                     borderRadius: BorderRadius.circular(25),

//                                     // image: DecorationImage(
//                                     //   image:
//                                     //       AssetImage(persons[index].urlImg),
//                                     //   fit: BoxFit.cover,
//                                     // ),
//                                     //color: Colors.transparent,
//                                   ),
//                                   child: PageView(
//                                     // physics:
//                                     //     const NeverScrollableScrollPhysics(),
//                                     scrollDirection: Axis.horizontal,
//                                     children: [
//                                       //------------First page view ---------//
//                                       Container(
//                                         //color: Colors.cyan,
//                                         alignment: Alignment.center,
//                                         child: 
//                                       ),

//                                       //------------second page view ---------//
//                                       Expanded(
//                                         child: Container(
//                                           color: Colors.white,
//                                           alignment: Alignment.center,
//                                           child: Column(
//                                             children: [

//                                             ],
//                                           ),
//                                         ),
//                                       ),

//                                       //------------third page view ---------//
//                                       Container(
//                                         color: Colors.white,
//                                         child: Padding(
//                                           padding: const EdgeInsets.fromLTRB(
//                                               10, 15, 10, 10),
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   const Icon(
//                                                     Icons.cancel,
//                                                     size: 15,
//                                                     color: Colors.white,
//                                                   ),
//                                                   customText(
//                                                       text: "Match Insights",
//                                                       fontSize: 16,
//                                                       textColor: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight.w600),
//                                                   const Icon(
//                                                     Icons.close,
//                                                     size: 20,
//                                                     color: Colors.black,
//                                                   ),
//                                                 ],
//                                               ),
//                                               heightSpace(20),
//                                               SizedBox(
//                                                 height: screenHeight * 0.13,
//                                                 width: screenWidth * 85,
//                                                 //color: Colors.amber,
//                                                 child: Stack(
//                                                   children: [
//                                                     Center(
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .center,
//                                                         children: [
//                                                           CircleAvatar(
//                                                             radius: 50,
//                                                             backgroundColor:
//                                                                 Colors.grey
//                                                                     .shade200,
//                                                           ),
//                                                           widthSpace(10),
//                                                           CircleAvatar(
//                                                             radius: 50,
//                                                             backgroundColor:
//                                                                 Colors.grey
//                                                                     .shade200,
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     Container(
//                                                       alignment:
//                                                           Alignment.center,
//                                                       child: Image.asset(
//                                                         DiscoveryImage.love,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               heightSpace(15),
//                                               customText(
//                                                   text:
//                                                       "Discover Deeper Connections\nwith Match Insights",
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w600,
//                                                   textColor: Colors.black,
//                                                   lines: 2,
//                                                   textAlignment:
//                                                       TextAlign.center),
//                                               heightSpace(20),
//                                               Container(
//                                                 padding:
//                                                     const EdgeInsets.all(20),
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(15),
//                                                   color:
//                                                       const Color(0xffFFF6D9),
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                       color: Colors.grey
//                                                           .withOpacity(0.2),
//                                                       spreadRadius: 2,
//                                                       blurRadius: 5,
//                                                       offset: const Offset(0,
//                                                           3), // changes the position of the shadow
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 child: Row(
//                                                   children: [
//                                                     Container(
//                                                       height:
//                                                           screenHeight * 0.08,
//                                                       width: 65,
//                                                       decoration: BoxDecoration(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(20),
//                                                           color: const Color(
//                                                               0xffFFF6D9),
//                                                           image:
//                                                               const DecorationImage(
//                                                             image: AssetImage(
//                                                                 DiscoveryImage
//                                                                     .compat),
//                                                           )),
//                                                     ),
//                                                     widthSpace(10),
//                                                     Expanded(
//                                                       child: Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           customText(
//                                                             text:
//                                                                 "Compatibility",
//                                                             fontSize: 15,
//                                                             fontWeight:
//                                                                 FontWeight.w600,
//                                                             textColor:
//                                                                 Colors.black,
//                                                           ),
//                                                           heightSpace(5),
//                                                           customText(
//                                                             text:
//                                                                 "Explore a detailed breakdown of your compatibility across various dimensions, from shared interests to core values",
//                                                             fontSize: 11,
//                                                             lines: 3,
//                                                             fontWeight:
//                                                                 FontWeight.w400,
//                                                             textColor:
//                                                                 Colors.black,
//                                                           )
//                                                         ],
//                                                       ),
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                               heightSpace(15),
//                                               Container(
//                                                 padding:
//                                                     const EdgeInsets.all(20),
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(15),
//                                                   color:
//                                                       const Color(0xffD2E6EB),
//                                                   boxShadow: [
//                                                     BoxShadow(
//                                                       color: Colors.grey
//                                                           .withOpacity(0.2),
//                                                       spreadRadius: 2,
//                                                       blurRadius: 5,
//                                                       offset: const Offset(0,
//                                                           3), // changes the position of the shadow
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 child: Row(
//                                                   children: [
//                                                     Container(
//                                                       height:
//                                                           screenHeight * 0.08,
//                                                       width: 65,
//                                                       decoration: BoxDecoration(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(20),
//                                                           color: const Color(
//                                                               0xffFFF6D9),
//                                                           image:
//                                                               const DecorationImage(
//                                                             image: AssetImage(
//                                                                 DiscoveryImage
//                                                                     .proba),
//                                                           )),
//                                                     ),
//                                                     widthSpace(10),
//                                                     Expanded(
//                                                       child: Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           customText(
//                                                             text: "Probability",
//                                                             fontSize: 15,
//                                                             fontWeight:
//                                                                 FontWeight.w600,
//                                                             textColor:
//                                                                 Colors.black,
//                                                           ),
//                                                           heightSpace(5),
//                                                           customText(
//                                                             text:
//                                                                 "Our algorithms consider your preferences to estimate the likelihood of meeting your dream match.",
//                                                             fontSize: 11,
//                                                             lines: 3,
//                                                             fontWeight:
//                                                                 FontWeight.w400,
//                                                             textColor:
//                                                                 Colors.black,
//                                                           )
//                                                         ],
//                                                       ),
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             )),





// SizedBox(
//                               width: double.infinity,
//                               height: screenHeight * 0.60,
//                               child: Transform.scale(
//                                 scale: 1,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(25.0),
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                       color: persons[index].color,
//                                       border: Border.all(
//                                         color: persons[index].color,
//                                         width: 2,
//                                       ),
//                                       borderRadius: BorderRadius.circular(25),

//                                       // image: DecorationImage(
//                                       //   image:
//                                       //       AssetImage(persons[index].urlImg),
//                                       //   fit: BoxFit.cover,
//                                       // ),
//                                       //color: Colors.transparent,
//                                     ),
//                                     child: PageView(
//                                       // physics:
//                                       //     const NeverScrollableScrollPhysics(),
//                                       scrollDirection: Axis.horizontal,
//                                       children: [
//                                         //------------First page view ---------//
//                                         Container(
//                                           //color: Colors.cyan,
//                                           alignment: Alignment.center,
//                                           child: Stack(
//                                             children: [
//                                               Container(
//                                                 height: MediaQuery.of(context)
//                                                     .size
//                                                     .height,
//                                                 width: double.infinity,
//                                                 decoration: BoxDecoration(
//                                                   //color: persons[index].color,
//                                                   color: Colors.white,
//                                                   image: DecorationImage(
//                                                     image: AssetImage(
//                                                         persons[index].urlImg),
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                   //color: Colors.transparent,
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(15.0),
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.end,
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         customText(
//                                                           text: persons[index]
//                                                               .name,
//                                                           fontSize: 20,
//                                                           textColor:
//                                                               Colors.white,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                         ),
//                                                         const SizedBox(
//                                                           width: 10,
//                                                         ),
//                                                         customText(
//                                                           text: persons[index]
//                                                               .age,
//                                                           fontSize: 20,
//                                                           textColor:
//                                                               Colors.white,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                     const SizedBox(height: 5),
//                                                     ClipRRect(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               10),
//                                                       child: Container(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(10),
//                                                         color: Colors.white38,
//                                                         child: customText(
//                                                           text: persons[index]
//                                                               .country,
//                                                           fontSize: 16,
//                                                           textColor:
//                                                               Colors.white,
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),

//                                         //------------second page view ---------//
//                                         Expanded(
//                                           child: Container(
//                                             color: Colors.white,
//                                             alignment: Alignment.center,
//                                             child: Column(
//                                               children: [
//                                                 Container(
//                                                   padding:
//                                                       const EdgeInsets.all(10),
//                                                   height: screenHeight * 0.44,
//                                                   width: screenWidth * 0.85,
//                                                   child: Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceBetween,
//                                                     children: [
//                                                       Column(
//                                                         children: [
//                                                           Container(
//                                                             height:
//                                                                 screenHeight *
//                                                                     0.12,
//                                                             width: screenWidth *
//                                                                 0.30,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           15),
//                                                               color:
//                                                                   Colors.cyan,
//                                                             ),
//                                                           ),
//                                                           heightSpace(10),
//                                                           customText(
//                                                             text: "You",
//                                                             fontSize: 14,
//                                                             fontWeight:
//                                                                 FontWeight.w600,
//                                                             textColor:
//                                                                 Colors.black,
//                                                           ),
//                                                           Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .cake,
//                                                                 text: "26",
//                                                               ),
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .timer,
//                                                                 text: "Night",
//                                                               ),
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .leo,
//                                                                 text: "Leo",
//                                                               ),
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .ruler,
//                                                                 text: "5'11",
//                                                               ),
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .weight,
//                                                                 text:
//                                                                     "Athletic",
//                                                               ),
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .location,
//                                                                 text: "Addison",
//                                                               ),
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .gender,
//                                                                 text:
//                                                                     "Straight",
//                                                               ),
//                                                             ],
//                                                           )
//                                                         ],
//                                                       ),
//                                                       widthSpace(10),
//                                                       Container(
//                                                         height:
//                                                             screenHeight * 0.90,
//                                                         width: 2,
//                                                         color: Colors.black12,
//                                                       ),
//                                                       widthSpace(10),
//                                                       Column(
//                                                         children: [
//                                                           Container(
//                                                             height:
//                                                                 screenHeight *
//                                                                     0.12,
//                                                             width: screenWidth *
//                                                                 0.30,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           15),
//                                                               color:
//                                                                   Colors.cyan,
//                                                             ),
//                                                           ),
//                                                           heightSpace(10),
//                                                           customText(
//                                                             text: "Maria",
//                                                             fontSize: 14,
//                                                             fontWeight:
//                                                                 FontWeight.w600,
//                                                             textColor:
//                                                                 Colors.black,
//                                                           ),
//                                                           Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .cake,
//                                                                 text: "24",
//                                                               ),
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .timer,
//                                                                 text: "Night",
//                                                               ),
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .virgo,
//                                                                 text: "Virgo",
//                                                               ),
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .ruler,
//                                                                 text: "5'1",
//                                                               ),
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .weight,
//                                                                 text: "Slim",
//                                                               ),
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .location,
//                                                                 text: "4.3ml",
//                                                               ),
//                                                               heightSpace(10),
//                                                               const Page2RowTextWidget(
//                                                                 imageString:
//                                                                     DiscoveryImage
//                                                                         .gender,
//                                                                 text:
//                                                                     "Straight",
//                                                               ),
//                                                             ],
//                                                           )
//                                                         ],
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Expanded(
//                                                   flex: 100,
//                                                   child: ListView.builder(
//                                                       physics:
//                                                           const NeverScrollableScrollPhysics(),
//                                                       shrinkWrap: true,
//                                                       itemCount: 5,
//                                                       itemBuilder:
//                                                           (context, index) {
//                                                         return Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .only(
//                                                                   left: 16,
//                                                                   right: 16,
//                                                                   bottom: 5),
//                                                           child: Container(
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             30),
//                                                                 color: Colors
//                                                                     .white,
//                                                                 border: Border.all(
//                                                                     color: Colors
//                                                                         .grey)),
//                                                             height: 40,
//                                                             width:
//                                                                 double.infinity,
//                                                             child: Row(
//                                                               children: [
//                                                                 const Padding(
//                                                                   padding: EdgeInsets
//                                                                       .only(
//                                                                           left:
//                                                                               8.0),
//                                                                   child: Text(
//                                                                     "My unpopular opininon.....",
//                                                                     style: TextStyle(
//                                                                         color: Color.fromARGB(
//                                                                             255,
//                                                                             140,
//                                                                             135,
//                                                                             135)),
//                                                                   ),
//                                                                 ),
//                                                                 const Spacer(),
//                                                                 IconButton(
//                                                                     onPressed:
//                                                                         () {},
//                                                                     icon:
//                                                                         const Icon(
//                                                                       Icons
//                                                                           .favorite_border,
//                                                                       color: Colors
//                                                                           .grey,
//                                                                       size: 20,
//                                                                     ))
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         );
//                                                       }),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Container(
//                                           color: Colors.white,
//                                           child: Padding(
//                                             padding: const EdgeInsets.fromLTRB(
//                                                 10, 15, 10, 10),
//                                             child: Column(
//                                               children: [
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     const Icon(
//                                                       Icons.cancel,
//                                                       size: 15,
//                                                       color: Colors.white,
//                                                     ),
//                                                     customText(
//                                                         text: "Match Insights",
//                                                         fontSize: 16,
//                                                         textColor: Colors.black,
//                                                         fontWeight:
//                                                             FontWeight.w600),
//                                                     const Icon(
//                                                       Icons.close,
//                                                       size: 20,
//                                                       color: Colors.black,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 heightSpace(20),
//                                                 SizedBox(
//                                                   height: screenHeight * 0.13,
//                                                   width: screenWidth * 85,
//                                                   //color: Colors.amber,
//                                                   child: Stack(
//                                                     children: [
//                                                       Center(
//                                                         child: Row(
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .center,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .center,
//                                                           children: [
//                                                             CircleAvatar(
//                                                               radius: 50,
//                                                               backgroundColor:
//                                                                   Colors.grey
//                                                                       .shade200,
//                                                             ),
//                                                             widthSpace(10),
//                                                             CircleAvatar(
//                                                               radius: 50,
//                                                               backgroundColor:
//                                                                   Colors.grey
//                                                                       .shade200,
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       Container(
//                                                         alignment:
//                                                             Alignment.center,
//                                                         child: Image.asset(
//                                                           DiscoveryImage.love,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 heightSpace(15),
//                                                 customText(
//                                                     text:
//                                                         "Discover Deeper Connections\nwith Match Insights",
//                                                     fontSize: 15,
//                                                     fontWeight: FontWeight.w600,
//                                                     textColor: Colors.black,
//                                                     lines: 2,
//                                                     textAlignment:
//                                                         TextAlign.center),
//                                                 heightSpace(20),
//                                                 Container(
//                                                   padding:
//                                                       const EdgeInsets.all(20),
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             15),
//                                                     color:
//                                                         const Color(0xffFFF6D9),
//                                                     boxShadow: [
//                                                       BoxShadow(
//                                                         color: Colors.grey
//                                                             .withOpacity(0.2),
//                                                         spreadRadius: 2,
//                                                         blurRadius: 5,
//                                                         offset: const Offset(0,
//                                                             3), // changes the position of the shadow
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   child: Row(
//                                                     children: [
//                                                       Container(
//                                                         height:
//                                                             screenHeight * 0.08,
//                                                         width: 65,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             20),
//                                                                 color: const Color(
//                                                                     0xffFFF6D9),
//                                                                 image:
//                                                                     const DecorationImage(
//                                                                   image: AssetImage(
//                                                                       DiscoveryImage
//                                                                           .compat),
//                                                                 )),
//                                                       ),
//                                                       widthSpace(10),
//                                                       Expanded(
//                                                         child: Column(
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             customText(
//                                                               text:
//                                                                   "Compatibility",
//                                                               fontSize: 15,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w600,
//                                                               textColor:
//                                                                   Colors.black,
//                                                             ),
//                                                             heightSpace(5),
//                                                             customText(
//                                                               text:
//                                                                   "Explore a detailed breakdown of your compatibility across various dimensions, from shared interests to core values",
//                                                               fontSize: 11,
//                                                               lines: 3,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400,
//                                                               textColor:
//                                                                   Colors.black,
//                                                             )
//                                                           ],
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 heightSpace(15),
//                                                 Container(
//                                                   padding:
//                                                       const EdgeInsets.all(20),
//                                                   decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             15),
//                                                     color:
//                                                         const Color(0xffD2E6EB),
//                                                     boxShadow: [
//                                                       BoxShadow(
//                                                         color: Colors.grey
//                                                             .withOpacity(0.2),
//                                                         spreadRadius: 2,
//                                                         blurRadius: 5,
//                                                         offset: const Offset(0,
//                                                             3), // changes the position of the shadow
//                                                       ),
//                                                     ],
//                                                   ),
//                                                   child: Row(
//                                                     children: [
//                                                       Container(
//                                                         height:
//                                                             screenHeight * 0.08,
//                                                         width: 65,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             20),
//                                                                 color: const Color(
//                                                                     0xffFFF6D9),
//                                                                 image:
//                                                                     const DecorationImage(
//                                                                   image: AssetImage(
//                                                                       DiscoveryImage
//                                                                           .proba),
//                                                                 )),
//                                                       ),
//                                                       widthSpace(10),
//                                                       Expanded(
//                                                         child: Column(
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             customText(
//                                                               text:
//                                                                   "Probability",
//                                                               fontSize: 15,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w600,
//                                                               textColor:
//                                                                   Colors.black,
//                                                             ),
//                                                             heightSpace(5),
//                                                             customText(
//                                                               text:
//                                                                   "Our algorithms consider your preferences to estimate the likelihood of meeting your dream match.",
//                                                               fontSize: 11,
//                                                               lines: 3,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w400,
//                                                               textColor:
//                                                                   Colors.black,
//                                                             )
//                                                           ],
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ))),
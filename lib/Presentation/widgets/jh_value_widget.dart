import 'dart:math';

import 'package:flutter/material.dart';

class ValueWidget extends StatelessWidget {
  const ValueWidget({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Flexible(
      child: Container(
        // height: screenHeight * 0.8,
          decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
      topRight: Radius.circular(12.0),
      ),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('Value Analysis',
                    style: TextStyle(
                      color: Color(0xFF1E1E1E),
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      height: 2.0,
                    ),
                  ),
                  const SizedBox(height: 25,),
                  CustomCircularProgressBar(
                    width: 120.0, // Width of the circular progress bar
                    height: 120.0, // Height of the circular progress bar
                    progress: 0.57, // Progress value between 0.0 and 1.0
                    strokeWidth: 25.0, // Width of the progress bar line
                    color: const Color.fromRGBO(254, 208, 63, 1), value: 57, // Color of the progress bar
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                      'Having aligned values is crucial for a successful and fulfilling relationship',
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontFamily: 'Poppins', // Font family
                      fontSize: 12.0, // Font size
                      fontStyle: FontStyle.normal, // Font style
                      fontWeight: FontWeight.w400, // Font weight
                      letterSpacing: 0.0, // Letter spacing
                      height: 1.0, // Line height
                    ),
                    textAlign: TextAlign.center,

                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    "Here's a breakdown of how your beliefs and principles align:",
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontFamily: 'Poppins', // Font family
                      fontSize: 12.0, // Font size
                      fontStyle: FontStyle.normal, // Font style
                      fontWeight: FontWeight.w600, // Font weight
                      letterSpacing: 0.0, // Letter spacing
                      height: 1.0, // Line height
                    ),
                    textAlign: TextAlign.center,
                  ),



                ],
              ),
            ),
            const SizedBox(height: 20,),
            Flexible(
              child: Container(
                // height: screenHeight * 0.36,
      width: screenWidth,

      decoration: const BoxDecoration(
        color: Color.fromRGBO(254, 208, 63, 0.2),
      borderRadius: BorderRadius.only(
      topLeft: Radius.circular(12.0),
      topRight: Radius.circular(12.0),
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),



      ),),
                child: Column(
                  children: [
                    const SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 290,
                            child:  const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Family',
                                  style: TextStyle(
                                    color: Colors.black, // Text color
                                    fontFamily: 'Poppins', // Font family
                                    fontSize: 12.0, // Font size
                                    fontStyle: FontStyle.normal, // Font style
                                    fontWeight: FontWeight.w700, // Font weight
                                    height: 1.0, // Line height
                                  ),
                                  textAlign: TextAlign.left,

                                ),
                                SizedBox(height:5),
                                Text(
                                 "You both scored 88% Your compatibility in family values ensures a shared vision for the future and a strong sense of support for one another.",
                                  style: TextStyle(
                                    color: Colors.black, // Text color
                                    fontFamily: 'Poppins', // Font family
                                    fontSize: 10.0, // Font size
                                    fontStyle: FontStyle.normal, // Font style
                                    fontWeight: FontWeight.w500, // Font weight
                                    height: 1.0, // Line height
                                  ),
                                )
                              ],
                            ) ,
                          ),
                          RoundedContainer(
                            text: '88%',
                            backgroundColor: const Color.fromRGBO(254, 208, 63, 1),
                          ),
                        ],
                      ),
                    ),
                    const Divider( // This creates a horizontal line
                      color: Color.fromRGBO(138, 138, 138, 0.20), // Line color
                      thickness: 2, // Line thickness
                      indent: 10, // Indent (space before the line)
                      endIndent: 10, // End indent (space after the line)
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 290,
                            child:  const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Goals',
                                  style: TextStyle(
                                    color: Colors.black, // Text color
                                    fontFamily: 'Poppins', // Font family
                                    fontSize: 12.0, // Font size
                                    fontStyle: FontStyle.normal, // Font style
                                    fontWeight: FontWeight.w700, // Font weight
                                    height: 1.0, // Line height
                                  ),
                                  textAlign: TextAlign.left,

                                ),
                                SizedBox(height:5),
                                Text(
                                  "both scored 65% Your ambition and goals are somewhat aligned, providing room for growth and understanding as you work together towards your aspirations.",
                                  style: TextStyle(
                                    color: Colors.black, // Text color
                                    fontFamily: 'Poppins', // Font family
                                    fontSize: 10.0, // Font size
                                    fontStyle: FontStyle.normal, // Font style
                                    fontWeight: FontWeight.w500, // Font weight
                                    height: 1.0, // Line height
                                  ),
                                )
                              ],
                            ) ,
                          ),
                          RoundedContainer(
                            text: '65%',
                            backgroundColor:const Color.fromRGBO(254, 208, 63, 1),
                          ),
                        ],
                      ),
                    ),
                    const Divider( // This creates a horizontal line
                      color: Color.fromRGBO(138, 138, 138, 0.20), // Line color
                      thickness: 2, // Line thickness
                      indent: 10, // Indent (space before the line)
                      endIndent: 10, // End indent (space after the line)
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 290,
                            child:  const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Finances',
                                  style: TextStyle(
                                    color: Colors.black, // Text color
                                    fontFamily: 'Poppins', // Font family
                                    fontSize: 12.0, // Font size
                                    fontStyle: FontStyle.normal, // Font style
                                    fontWeight: FontWeight.w700, // Font weight
                                    height: 1.0, // Line height
                                  ),
                                  textAlign: TextAlign.left,

                                ),
                                SizedBox(height:5),
                                Text(
                                  "You both scored 78% Your shared approach to financial responsibility leads to responsible money management and reduced conflicts over finances.",
                                  style: TextStyle(
                                    color: Colors.black, // Text color
                                    fontFamily: 'Poppins', // Font family
                                    fontSize: 10.0, // Font size
                                    fontStyle: FontStyle.normal, // Font style
                                    fontWeight: FontWeight.w500, // Font weight
                                    height: 1.0, // Line height
                                  ),
                                )
                              ],
                            ) ,
                          ),
                          RoundedContainer(
                            text: '78%',
                            backgroundColor: const Color.fromRGBO(253,192,0, 1),
                          ),
                        ],
                      ),
                    ),
                    const Divider( // This creates a horizontal line
                      color: Color.fromRGBO(138, 138, 138, 0.20), // Line color
                      thickness: 2, // Line thickness
                      indent: 10, // Indent (space before the line)
                      endIndent: 10, // End indent (space after the line)
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 290,
                            child:  const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Social Values',
                                  style: TextStyle(
                                    color: Colors.black, // Text color
                                    fontFamily: 'Poppins', // Font family
                                    fontSize: 12.0, // Font size
                                    fontStyle: FontStyle.normal, // Font style
                                    fontWeight: FontWeight.w700, // Font weight
                                    height: 1.0, // Line height
                                  ),
                                  textAlign: TextAlign.left,

                                ),
                                SizedBox(height:5),
                                Text(
                                  "You both scored 95% Your high compatibility in social values creates a common ground for social interactions and shared values in society.",
                                  style: TextStyle(
                                    color: Colors.black, // Text color
                                    fontFamily: 'Poppins', // Font family
                                    fontSize: 10.0, // Font size
                                    fontStyle: FontStyle.normal, // Font style
                                    fontWeight: FontWeight.w500, // Font weight
                                    height: 1.0, // Line height
                                  ),
                                )
                              ],
                            ) ,
                          ),
                          RoundedContainer(
                            text: '95%',
                            backgroundColor: const Color.fromRGBO(253,192,0, 1),
                          ),
                        ],
                      ),
                    ),
                    const Divider( // This creates a horizontal line
                      color: Color.fromRGBO(138, 138, 138, 0.20), // Line color
                      thickness: 2, // Line thickness
                      indent: 10, // Indent (space before the line)
                      endIndent: 10, // End indent (space after the line)
                    ),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}


class CustomCircularProgressBar extends StatefulWidget {
  final double width;
  final double height;
  final double progress;
  final double strokeWidth;
  final Color color;
  final int value;

  CustomCircularProgressBar({
    required this.width,
    required this.height,
    required this.progress,
    required this.strokeWidth,
    required this.color, required this.value,

  });

  @override
  _CustomCircularProgressBarState createState() =>
      _CustomCircularProgressBarState();
}

class _CustomCircularProgressBarState extends State<CustomCircularProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.width / 2.0), // Make it circular
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2), // Shadow color
            spreadRadius: 5, // Spread radius
            blurRadius: 10, // Blur radius
            offset: const Offset(10, 0), // Shadow offset
          ),
        ],
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [

          CustomPaint(
            size: Size(widget.width, widget.height),
            painter: CircularProgressBarPainter(
              progress: widget.progress,
              strokeWidth: widget.strokeWidth,
              color: widget.color,
            ),

          ),
          Positioned(
            top: widget.height / 2.2 ,
              left: widget.width / 2.8,
              child:  Text(
                '${widget.value}%',
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.0,
                  height: 1.0,
                ),
              )
          )
        ],
      ),
    );
  }
}

class CircularProgressBarPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color color;


  CircularProgressBarPainter({
    required this.progress,
    required this.strokeWidth,
    required this.color,

  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color.fromRGBO(238,238, 238, 1) // Background color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2);

    // Draw the background circle
    canvas.drawCircle(center, radius, paint);

    paint.color = color; // Set the color to the progress color

    final double sweepAngle = 360 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start angle
      degreesToRadians(sweepAngle), // Sweep angle
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }
}


class RoundedContainer extends StatelessWidget {
  final String text;
  final Color backgroundColor;

  RoundedContainer({
    required this.text,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(75.0), // Adjust the radius as needed
          ),

        ),
        Positioned(
          top: 15,
          left: 10,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white, // Text color
              fontSize: 12.0, // Font size
            ),
          ),
        ),
      ],

    );
  }
}
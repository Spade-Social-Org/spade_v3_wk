import 'package:flutter/material.dart';

class Content {
  final String name;
  final Color color;
  final String urlImg;
  final String age;
  final String country;
  final String percentage;

  Content(this.name, this.color, this.urlImg, this.age, this.country,
      this.percentage);
}

  List<Content> persons = [
    Content(
      "Jane",
      Color.fromARGB(255, 37, 140, 42),
      "assets/images/Rectangle 1598.png",
      "20",
      'United State',
      "100",
    ),
    Content(
      "Paul",
      Color.fromARGB(255, 37, 140, 42),
      "assets/images/Rectangle 1597.png",
      "20",
      'United State',
      "80",
    ),
    Content("Mike", Color.fromARGB(255, 148, 17, 8),
        "assets/images/Rectangle 1595.png", "20", 'United State', "50"),
    Content("John", Color.fromARGB(255, 204, 167, 1),
        "assets/images/Screenshot.png", "20", 'United State', "45"),
    Content("Jane", Color.fromARGB(255, 37, 140, 42),
        "assets/images/Rectangle 1598.png", "20", 'United State', "60"),
    Content("Paul", Color.fromARGB(255, 37, 140, 42),
        "assets/images/Rectangle 1597.png", "20", 'United State', "55"),
    Content("Mike", Color.fromARGB(255, 148, 17, 8),
        "assets/images/Rectangle 1595.png", "20", 'United State', "90"),
    Content("John", Color.fromARGB(255, 204, 167, 1),
        "assets/images/Screenshot.png", "20", 'United State', "60"),
  ];

 
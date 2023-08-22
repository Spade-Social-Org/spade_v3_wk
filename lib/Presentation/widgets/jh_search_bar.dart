import 'package:flutter/material.dart';

class JHSearchField extends StatelessWidget {
  const JHSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: GestureDetector(
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white24, borderRadius: BorderRadius.circular(30)),
          child: const TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search for places",
                hintStyle: TextStyle(color: Colors.white60, fontSize: 20),
                suffixIcon: Icon(Icons.search),
                suffixIconColor: Colors.white60),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'add_religion_screen.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
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
            const SizedBox(
              height: 40,
            ),
            const Center(
                child: Text(
              "Where do you live ?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            Center(child: Image.asset("assets/images/location2.png")),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.location_on_outlined),
                Text(
                  "Country",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Cameroon",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
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
                              builder: ((context) => AddReligionScreen())));
                    }),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

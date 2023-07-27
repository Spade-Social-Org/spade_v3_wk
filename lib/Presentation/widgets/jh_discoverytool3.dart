import 'package:flutter/material.dart';

class JHDiscoveryTool3 extends StatelessWidget {
  const JHDiscoveryTool3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 200,
      width: 320,
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                card2(
                  name: 'Natalia',
                  image: "asset/images/Rectangle 1595.png",
                ),
                Divider(
                  height: 50,
                  thickness: 3,
                  color: Colors.black,
                ),
                card2(
                  name: "Maria",
                  image: "asset/images/Rectangle 1598.png",
                ),
              ],
            ),
            button(
              name: "My unpopuolar opinion is ....",
            ),
            button(
              name: "Go-to-dish to cook ....",
            ),
            button(
              name: "Topics to debate ....",
            ),
            button(name: 'One thing i cannot live without ....')
          ],
        ),
      ),
    );
  }
}

class button extends StatelessWidget {
  final String name;
  const button({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(name), const Icon(Icons.heart_broken)],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class card2 extends StatelessWidget {
  final String name;
  final String image;
  const card2({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            )),
        Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.cake),
            Text('24'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.nightlight_outlined),
            const Text('Night'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image.asset('asset/logo/icon-park-outline_virgo.png'),
            const Text('virgo'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.line_weight),
            const Text('51'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.location_on_outlined),
            const Text('4.3ml'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.location_on),
            const Text('Slim'),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image.asset('asset/images/bi_gender-male.png'),
            Text('Straight'),
          ],
        ),
      ],
    );
  }
}

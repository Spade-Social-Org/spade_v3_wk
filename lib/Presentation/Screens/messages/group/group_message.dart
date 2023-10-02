import 'package:flutter/material.dart';

import '../widget/custom_appbar.dart';
import '../widget/custom_iconbutton.dart';
import '../widget/grouped_avatar.dart';

class GroupMessage extends StatefulWidget {
  const GroupMessage({super.key});

  @override
  State<GroupMessage> createState() => _GroupMessageState();
}

class _GroupMessageState extends State<GroupMessage> {
  final list = ['All', 'New to the Area', 'Gamers', 'Afro Vibe'];
  String currentIndex = 'All';
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010C33),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const CustomAppbar(
                title: 'Groups',
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  'Top 5 groups',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(5, (i) => const GroupedAvatar()),
              ),
              const SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset('assets/images/search.png',
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CustomIconButton(
                            color: Colors.white,
                            imageValue: 'spade-filled',
                            onTap: () {},
                            size: 25),
                        const Positioned(
                            top: 8,
                            right: 10,
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 8,
                              child: Text(
                                '2',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                      ],
                    ),
                    CustomIconButton(
                        color: Colors.white,
                        imageValue: 'grid',
                        onTap: () {},
                        size: 22),
                    CustomIconButton(
                        color: Colors.white,
                        imageValue: 'list',
                        onTap: () {},
                        size: 22),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              SingleChildScrollView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: list.map((e) {
                  bool isSelected = currentIndex == e;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: MaterialButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        setState(() => currentIndex = e);
                      },
                      child: AnimatedContainer(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        duration: const Duration(seconds: 1),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          e,
                          style: TextStyle(
                              color: isSelected ? Colors.black : Colors.grey),
                        ),
                      ),
                    ),
                  );
                }).toList()),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  'Trending Now',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        5,
                        (i) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/image.png'))),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Explore Dallas',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  )
                                ],
                              ),
                            )),
                  )),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  'Recommended for you',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        5,
                        (i) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/image.png'))),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Explore Dallas',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  )
                                ],
                              ),
                            )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MessageLikesTab extends StatelessWidget {
  const MessageLikesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
                indicatorWeight: 4,
                labelColor: Color(0xff8A8A8A),
                indicatorColor: Color(0xff8A8A8A),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [Tab(text: 'Jokers'), Tab(text: 'Aces')]),
            const SizedBox(height: 8),
            Expanded(
                child: TabBarView(children: [
              ListView(
                children: List.generate(
                  25,
                  (i) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: .2, color: const Color(0xff8A8A8A))),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/avatar.png',
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 8),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Maria',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text('Hey! How are you today?')
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('3:40'),
                              Row(
                                children: [
                                  MaterialButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {},
                                    minWidth: 60,
                                    height: 25,
                                    color: Colors.black,
                                    shape: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text(
                                      'New',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(width: 30)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 9 / 12,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount: 2),
                itemCount: 41,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/image1.png'))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 35,
                                width: 35,
                                child: CircularProgressIndicator(
                                  value: 0.6,
                                  strokeWidth: 6,
                                  color: const Color(0xff0C964C),
                                  backgroundColor:
                                      Colors.black45.withOpacity(0.5),
                                ),
                              ),
                              const Text(
                                '60%',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Maria, 27',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xff827070).withOpacity(0.8)),
                          child: const Text(
                            'Guinea',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ])),
            const SizedBox(height: 16),
          ],
        ));
  }
}

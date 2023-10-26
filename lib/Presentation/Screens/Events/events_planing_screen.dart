import 'package:flutter/material.dart';

import '../../widgets/jh_calender_widget.dart';

class EventPlaningScreen extends StatelessWidget {
  const EventPlaningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              child: Row(children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                const SizedBox(
                  width: 150,
                ),
                const Text(
                  "Calender",
                  style: TextStyle(fontSize: 20),
                )
              ]),
            ),
            const JHCalenderWidget(),
            const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                "Upcoming Events",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: dummyEventPlan.length,
                  itemBuilder: (context, index) {
                    final Event = dummyEventPlan[index];
                    return Card(
                      elevation: 5,
                      color: Colors.white,
                      child: ListTile(

                        title: Row(
                          children: [
                            const CircleAvatar(radius: 5,),const SizedBox(width: 5,),
                            Text(Event.time),
                          ],
                        ),
                        subtitle: Text(Event.activities),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}


class Event {
  final String time;
  final String activities;


  Event({
    required this.time,
    required this.activities,

  });

}


List<Event> dummyEventPlan = [
  Event(
    time: "fri,sep 10th, 7:3pm",
    activities: 'Dinner with Sophie',

  ),
  Event(
    time: "sat,sep 17th, 7:3pm",
    activities: 'Dinner with Sophie',
  ),Event(
    time: "sat,sep 23th, 7:3pm",
    activities: 'Dinner with Sophie',
  ),
];



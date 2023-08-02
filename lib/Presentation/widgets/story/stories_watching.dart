/*import 'package:flutter/material.dart';
import 'package:spade_v4/Common/theme.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class Fgfsgfs extends ValueNotifier<CrossFadeState> {
  Fgfsgfs() : super(CrossFadeState.showFirst);

  switchState() {
    if (value == CrossFadeState.showFirst) {
      value = CrossFadeState.showSecond;
    } else {
      value = CrossFadeState.showFirst;
    }
  }
}

class _ExampleState extends State<Example> {
  final _valueNotifier = Fgfsgfs();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('SOMETHING', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: ValueListenableBuilder(
          valueListenable: _valueNotifier,
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedCrossFade(
                  firstChild: const Text('ThankYou'),
                  secondChild: const Text('VeryMuch'),
                  crossFadeState: _valueNotifier.value,
                  duration: kAnimationDuration,
                ),
                child!
              ],
            );
          },
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              shape: MaterialStateProperty.all(const CircleBorder()),
            ),
            onPressed: _valueNotifier.switchState,
            child: const Icon(Icons.notification_add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';

class StoriesWatching extends StatefulWidget {
  const StoriesWatching({super.key});

  @override
  State<StoriesWatching> createState() => _StoriesWatchingState();
}

class _StoriesWatchingState extends State<StoriesWatching> {
  //final _controller = StoryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

/*[
  {
    gallery: ['http:cloudnyin.com'],
    description: 'sjdjdjdj',
    poster_name: 'john',
    poster_image: 'http://localhost',
  },
  {
    gallery: ['http:cloudnyin.com'],
    description: 'sjdjdjdj',
    poster_name: 'john',
    poster_image: 'http://localhost',
  },
];*/
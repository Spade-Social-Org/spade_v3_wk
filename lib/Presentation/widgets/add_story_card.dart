import 'package:flutter/material.dart';

class AddStoryCard extends StatelessWidget {
  const AddStoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          child:   Stack(
            children: [

              CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 25.0,
                backgroundImage: AssetImage(''),
              ),
              Positioned(
                bottom: 0,
                right: -10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(15)),
                    height: 25,
                    width: 25,
                    child: Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        iconSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

        // const Spacer(),
        const Text(
          "Your story",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            height: 1.4,
            color: Colors.grey,
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}

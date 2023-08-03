import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';

import '../../../Data/Models/post.dart';
import '../../Screens/Chats/chat_screen.dart';
import '../../Screens/Chats/message_screen.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.width()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.blue),
                            borderRadius: BorderRadius.circular(50),
                            //color: Colors.grey,
                            //image: Image.asset()
                          ),
                          height: 56.height(),
                          width: 48.width(),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 19.89.width()),
                                child: Text(
                                  post.postedby.username,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(left: 19.89.width()),
                              child: Text(
                                post.location,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.more_vert_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 21.width(), right: 21.width(), top: 8.height()),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                post.imageurl,
                height: 260.height(),
                width: 384.width(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.width()),
            child: Row(
              children: [
                LikeButton(
                  bubblesColor: const BubblesColor(
                      dotPrimaryColor: Colors.red,
                      dotSecondaryColor: Colors.purple),
                  circleColor:
                      const CircleColor(start: Colors.yellow, end: Colors.blue),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      //Icons.favorite_border_sharp,
                      post.isLiked
                          ? Icons.favorite_border_outlined
                          : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 21,
                    );
                  },
                  animationDuration: const Duration(milliseconds: 1000),
                ),
                SizedBox(
                  width: 11.53.width(),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const MessageScreen())));
                    },
                    child: Image.asset(
                      "assets/images/Path 740.png",
                      width: 17,
                    )),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      post.isBookmarked
                          ? Icons.bookmark_sharp
                          : Icons.bookmark_border_outlined,
                      color: post.isLiked ? Colors.grey : Colors.black,
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 21.width(), right: 8),
            child: Text(
              post.caption,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 21.width(), right: 8),
            child: Text(
              post.postedTimeAgo,
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 62.height(),
          ),
        ],
      ),
    );
  }
}

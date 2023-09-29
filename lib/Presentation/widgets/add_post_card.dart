import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';
import 'package:spade_v4/Common/extensions/date_time/date_time.dart';

import '../../../Data/Models/posts/post_model.dart';
import '../Screens/notworking/notworking.dart';
import '../logic_holder/bloc/heart_bloc/heart_bloc.dart';
import '../logic_holder/bloc/heart_bloc/heart_bloc_event.dart';
import '../logic_holder/bloc/heart_bloc/heart_bloc_state.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key, required this.posts}) : super(key: key);

  final Post posts;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  Widget _nullChecking() {
    if (widget.posts.posterImage == null) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
        ),
        height: 50.height(),
        width: 46.width(),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(50),
          image: DecorationImage(
            image: NetworkImage(widget.posts.posterImage!),
            fit: BoxFit.cover,
          ),
        ),
        height: 56.height(),
        width: 48.width(),
      );
    }
  }

  int currentPage = 0;
  // int loadedPosts = 0;
  // int postsToLoad = 10;

  // Future<void> loadNextPosts() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   setState(() {
  //     loadedPosts += postsToLoad;
  //   });
  //   if (loadedPosts % postsToLoad == 0) {
  //     loadNextPosts();
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   loadNextPosts();
  // }

  String date() {
    final difference = DateTime.now().difference(widget.posts.createAt);

    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} seconds ago";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else if (difference.inDays < 31) {
      return "${difference.inDays} days ago";
    } else if (difference.inWeeks() < 4) {
      return "${difference.inWeeks()} weeks ago";
    } else if (difference.inMonths() < 12) {
      return "${difference.inMonths()} months ago";
    }

    return "error";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
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
                          _nullChecking(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 19.89.width()),
                                child: Text(
                                  widget.posts.posterName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 19.89.width()),
                                child: const Text(
                                  "Nigeria",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
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
                left: 21.width(),
                right: 21.width(),
                top: 8.height(),
              ),
              child: Container(
                height: 260.height(),
                width: 384.width(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Image.network(
                          widget.posts.gallery[index],
                          fit: BoxFit.cover,
                        );
                      },
                      itemCount: widget.posts.gallery.length,
                    ),
                    Positioned(
                      bottom: 20.height(),
                      left: 172.width(),
                      child: buildDotRow(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18.width()),
              child: Row(
                children: [
                  BlocBuilder<HeartIconBloc, HeartIconState>(
                    builder: (context, state) {
                      return LikeButton(
                        isLiked: state.isFilled,
                        size: 26.0,
                        circleColor: const CircleColor(
                            start: Colors.red, end: Colors.red),
                        bubblesColor: const BubblesColor(
                          dotPrimaryColor: Colors.red,
                          dotSecondaryColor: Colors.red,
                        ),
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : Colors.grey,
                            size: 21,
                          );
                        },
                        onTap: (isLiked) {
                          BlocProvider.of<HeartIconBloc>(context)
                              .add(ToggleHeartIconEvent());
                          return Future.value(!isLiked);
                        },
                        animationDuration: const Duration(milliseconds: 1000),
                      );
                    },
                  ),
                  SizedBox(
                    width: 11.53.width(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const NotWorking()),
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/Path 740.png",
                      width: 17,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 21.width(), right: 8),
              child: Text(
                widget.posts.description,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10.height(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 21.width(), right: 8),
              child: Text(
                date(),
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 62.height(),
            ),
          ],
        ),
        // if (loadedPosts % postsToLoad == 0 && loadedPosts > 0)
        //   Positioned(
        //     bottom: 0,
        //     left: 172.width(),
        //     child: const CircularProgressIndicator(),
        //   ),
      ],
    );
  }

  Widget buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: EdgeInsets.only(right: 5.width()),
      height: 11.height(),
      width: 9.width(),
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Row buildDotRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.posts.gallery.length,
        (index) => buildDot(index: index),
      ),
    );
  }
}

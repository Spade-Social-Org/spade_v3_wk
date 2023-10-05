import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';
import 'package:spade_v4/Common/extensions/date_time/date_time.dart';

import '../../../Common/managers/barrel_manager.dart';
import '../../../Common/managers/font_style_manager/font_style_manager.dart.dart';
import '../../../Data/Models/story/story_view_model.dart';
import '../Bloc/heart_bloc/heart_bloc.dart';
import '../Bloc/heart_bloc/heart_bloc_event.dart';
import '../Bloc/heart_bloc/heart_bloc_state.dart';
import 'animated_line.dart';

class ViewStoryPage extends StatefulWidget {
  final Storyy storry;

  const ViewStoryPage({
    Key? key,
    required this.storry,
  }) : super(key: key);

  @override
  State<ViewStoryPage> createState() => _ViewStoryPageState();
}

class _ViewStoryPageState extends State<ViewStoryPage>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  int _currentStory = 0;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 1.0);
    _animationController = AnimationController(vsync: this);

    _showStory();
    _animationController.addStatusListener(_statusListener);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeStatusListener(_statusListener);
    _animationController.dispose();

    _pageController.dispose();
    super.dispose();
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _nextStory();
    }
  }

  void _showStory() {
    _animationController
      ..reset()
      ..duration = const Duration(seconds: 4)
      ..forward();
  }

  void _nextStory() {
    if (_currentStory < widget.storry.gallery!.length - 1) {
      setState(() => _currentStory++);

      _pageController.nextPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutQuint);
      _showStory();
    }
  }

  void _previousStory() {
    if (_currentStory > 0) {
      setState(() => _currentStory--);
      _pageController.previousPage(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutQuint);
      _showStory();
    }
  }

  String date() {
    final difference = DateTime.now().difference(widget.storry.createAt);

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTapDown: (details) {
              if (details.globalPosition.dx < size.width / 2) {
                _previousStory();
              } else {
                _nextStory();
              }
            },
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              itemCount: widget.storry.gallery!.length,
              itemBuilder: (context, index) {
                return Image.network(
                  widget.storry.gallery![index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          const SizedBox(height: 10.0),
          Column(
            children: [
              const SizedBox(height: 30.0),
              Row(
                children: List.generate(
                  widget.storry.gallery!.length,
                  (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: AnimatedLineStory(
                        index: index,
                        selectedIndex: _currentStory,
                        animationController: _animationController,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 11.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 18.width()),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 46.height(),
                          width: 46.width(),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              widget.storry.posterImage,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.height()),
                        Text(
                          date(),
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      "assets/images/img/cancel.png",
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const Spacer(),
              Container(
                height: 131.height(),
                width: 428.width(),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 67.height()),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.width(), bottom: 21.height()),
                        child: SizedBox(
                          width: 282.width(),
                          height: 43.height(),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefix: Padding(
                                padding: EdgeInsets.only(
                                    left: 9.width(),
                                    top: 12.height(),
                                    right: 6.width()),
                                child: Image.asset(
                                  AssetManager.camera2,
                                ),
                              ),

                              suffix: Padding(
                                padding: EdgeInsets.only(
                                  right: 11.width(),
                                  top: 12.height(),
                                ),
                                child: Image.asset(AssetManager.send),
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 10.0, top: 10.0, bottom: 10.0),
                              hintText: 'Message...',

                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(23),
                                ),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.5),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(23),
                                ),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.5),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(23),
                                ),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.5),
                              ),
                              hintStyle: Inter.font601,
                              // isDense: true,
                              // constraints: BoxConstraints(maxHeight: 43.height()),
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                      SizedBox(width: 28.width()),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.height()),
                        child: BlocBuilder<HeartIconBloc, HeartIconState>(
                          builder: (context, state) {
                            return LikeButton(
                              isLiked: state.isFilled,
                              size: 26,
                              circleColor: const CircleColor(
                                  start: Colors.red, end: Colors.red),
                              bubblesColor: const BubblesColor(
                                dotPrimaryColor: Colors.red,
                                dotSecondaryColor: Colors.red,
                              ),
                              likeBuilder: (bool isLiked) {
                                return Icon(
                                  isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isLiked ? Colors.red : Colors.grey,
                                  size: 26,
                                );
                              },
                              onTap: (isLiked) {
                                BlocProvider.of<HeartIconBloc>(context)
                                    .add(ToggleHeartIconEvent());
                                return Future.value(!isLiked);
                              },
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 17.width()),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.height()),
                        child: Image.asset(AssetManager.locate),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

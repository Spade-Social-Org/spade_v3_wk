import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spade_v4/Common/constants.dart';
import 'package:spade_v4/Common/theme.dart';
import 'package:spade_v4/Common/utils/utils.dart';
import 'package:spade_v4/Presentation/Screens/Home/models/feed_model.dart';
import 'package:spade_v4/Presentation/Screens/Home/presentation/widgets/profile_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spade_v4/resources/resources.dart';

class FeedBox extends ConsumerWidget {
  final Feed feed;
  final bool isLoad;
  const FeedBox({
    super.key,
    required this.feed,
    this.isLoad = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (isLoad)
              Container(
                width: 50.84,
                height: 46,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/51x46"),
                    fit: BoxFit.cover,
                  ),
                  shape: OvalBorder(),
                ),
              )
            else
              OvalProfileImage(
                imageUrl: feed.posterImage ?? AppConstants.defaultImage,
              ),
            17.spacingW,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feed.posterName ?? '',
                    style: CustomTextStyle.large16.white.w600,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.more_vert,
              color: Color(0xffB8B6B6),
            ),
          ],
        ),
        6.spacingH,
        Gallery(feed: feed),
        8.spacingH,
        if (isLoad)
          Row(
            children: [
              const Icon(Icons.more_vert),
              12.spacingW,
              const Icon(Icons.more_vert),
              const Spacer(),
              const Icon(Icons.more_vert),
            ],
          )
        else
          Row(
            children: [
              SvgPicture.asset(
                SpiderSvgAssets.heart,
              ),
              12.spacingW,
              SvgPicture.asset(
                SpiderSvgAssets.message,
              ),
              const Spacer(),
              SvgPicture.asset(
                SpiderSvgAssets.bookmark,
              ),
            ],
          ),
        10.spacingH,
        Text(feed.description ?? '', style: CustomTextStyle.small12.white),
        10.spacingH,
        Text(timeago.format(feed.createdAt ?? DateTime.now()),
            style: CustomTextStyle.extraSmall11
                .withColor(const Color(0xffB8B6B6))
                .withSize(10.2)),
      ],
    );
  }
}

class Gallery extends StatefulWidget {
  const Gallery({
    super.key,
    required this.feed,
  });

  final Feed feed;

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 260.0,
            enableInfiniteScroll: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: widget.feed.gallery
                  ?.map(
                    (e) => Container(
                      width: double.infinity,
                      height: 260,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(e),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  )
                  .toList() ??
              [],
        ),
        if ((widget.feed.gallery?.length ?? 0) > 1)
          Positioned(
            bottom: 27,
            child: Row(
              children: widget.feed.gallery
                      ?.mapIndexed(
                        (i, e) => Container(
                          width: 5.53,
                          height: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: ShapeDecoration(
                            color: i == _current
                                ? const Color(0xFF0C964C)
                                : Colors.white,
                            shape: const OvalBorder(),
                          ),
                        ),
                      )
                      .toList() ??
                  [],
            ),
          ),
      ],
    );
  }
}

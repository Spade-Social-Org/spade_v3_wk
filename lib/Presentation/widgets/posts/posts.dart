import 'package:flutter/material.dart';
import 'package:spade_v4/Common/extensions/barrel_extensions.dart';
import 'package:spade_v4/Presentation/widgets/posts/add_post_card.dart';

import '../../../Data/data_source/local_data_source/mock_data/mock.dart';



class PostUi extends StatefulWidget {
  const PostUi({super.key});

  @override
  State<PostUi> createState() => _PostUiState();
}

class _PostUiState extends State<PostUi> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700.height(),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostCard(
              post: posts[index],
            );
          }),
    );
  }
}

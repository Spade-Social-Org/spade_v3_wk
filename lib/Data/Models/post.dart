
import 'package:spade_v4/Data/Models/user_model.dart';

class Post {
  final String id;
  final User postedby;
  final String imageurl;
  final String title;
  final String caption;
  final String postedTimeAgo;
  final String totalLikes;
  final bool isLiked;
  final bool isBookmarked;
  final String location;

  Post(
      this.id,
      this.postedby,
      this.title,
      this.caption,
      this.postedTimeAgo,
      this.totalLikes,
      this.isLiked,
      this.isBookmarked,
      this.imageurl, 
      this.location, );
}

class JHUnbordingContent {
  String image;
  String title;
  String discription;

  JHUnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<JHUnbordingContent> contents = [
  JHUnbordingContent(
      title: 'Quality Food',
      image: 'assets/images/quality.svg',
      discription:
      "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  JHUnbordingContent(
      title: 'Fast Delevery',
      image: 'assets/images/delevery.svg',
      discription:
      "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  JHUnbordingContent(
      title: 'Reward surprises',
      image: 'assets/images/reward.svg',
      discription:
      "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
];

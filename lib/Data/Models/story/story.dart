
class StoryData {
  final int id;
  final String name;
  final String imageFileName;
  final bool isViewed;
  final bool isLive;

  StoryData({
    required this.id,
    required this.name,
    required this.imageFileName,
    required this.isViewed,
    required this.isLive,
  });
}

class StoriesDatabase {
  static List<StoryData> get stories {
    return [
      StoryData(
        id: 1001,
        name: 'Your Story',
        imageFileName: "assets/images/img/Camera.png",
        isViewed: false,
        isLive: false,
      ),
       StoryData(
        id: 1002,
        name: 'Aminat',
        imageFileName: "assets/images/stories/Aminat.png",
        isViewed: false,
        isLive: false,
      ),
       StoryData(
        id: 1003,
        name: 'Amrab',
        imageFileName: "assets/images/stories/Amrab.png",
        isViewed: false,
        isLive: false,
      ),
       StoryData(
        id: 1004,
        name: 'Blessing',
        imageFileName: "assets/images/stories/Blessing.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 1004,
        name: 'Deborah',
        imageFileName: "assets/images/stories/Deborah.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 1005,
        name: 'Dio',
        imageFileName: "assets/images/stories/Dio.png",
        isViewed: false,
        isLive: false,
      ),
          StoryData(
        id: 1006,
        name: 'Dutche',
        imageFileName: "assets/images/stories/Dutche.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 1007,
        name: 'Jexi',
        imageFileName: "assets/images/stories/Jexi.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 1008,
        name: 'Joy',
        imageFileName: "assets/images/stories/joy.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 1009,
        name: 'Kelvin',
        imageFileName: "assets/images/stories/Kelvin.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 10010,
        name: 'Kosi',
        imageFileName: "assets/images/stories/Kosi.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 10011,
        name: 'Lofi',
        imageFileName: "assets/images/stories/Lofi.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 1004,
        name: 'Luisiana',
        imageFileName: "assets/images/stories/Luisiana.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 10012,
        name: 'Micheal',
        imageFileName: "assets/images/stories/Micheal.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 10013,
        name: 'Mike',
        imageFileName: "assets/images/stories/Mike.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 10014,
        name: 'Nemi',
        imageFileName: "assets/images/stories/Nemi.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 10015,
        name: 'Peter',
        imageFileName: "assets/images/stories/Peter.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 10016,
        name: 'Praise',
        imageFileName: "assets/images/stories/Praise.png",
        isViewed: false,
        isLive: false,
      ),
        StoryData(
        id: 10017,
        name: 'Savi',
        imageFileName: "assets/images/stories/Savi.png",
        isViewed: false,
        isLive: false,
      ),
       StoryData(
        id: 10018,
        name: 'Temi',
        imageFileName: "assets/images/stories/Temi.png",
        isViewed: false,
        isLive: false,
      ),
       StoryData(
        id: 10019,
        name: 'Zeus',
        imageFileName: "assets/images/stories/Zeus.png",
        isViewed: false,
        isLive: false,
      )
    ];
  }
}

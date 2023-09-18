class Storyy {
  int id;
  String posterName;
  String posterImage;
  String description;
  List<String>? gallery;
  DateTime createAt;

  Storyy({
    required this.id,
    required this.posterName,
    required this.posterImage,
    required this.gallery,
    required this.description,
    required this.createAt,
  });
  static Storyy fromJson(Map<String, dynamic> json) {
    List<String> gallery = [];
    if (json["gallery"] != null && json["gallery"] is List<dynamic>) {
      gallery = List<String>.from(json["gallery"].map((x) => x as String));
    }
    int id = json['id'] ?? 0;
    return Storyy(
      createAt: DateTime.parse(json['created_at']),
      posterName: json['poster_name'],
      id: id,
      posterImage: json['poster_image'],
      description: json['description'],
      gallery: gallery,
    );
  }
}

class NewStory {
  String description;
  List<String> gallery;
  DateTime createAt;
  int id;

  NewStory({
    required this.id,
    required this.gallery,
    required this.description,
    required this.createAt,
  });

  static NewStory fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('id')) {
      throw Exception('Missing field: id');
    }
    if (!json.containsKey('created_at')) {
      throw Exception('Missing field: created_at');
    }
    if (!json.containsKey('description')) {
      throw Exception('Missing field: description');
    }
    if (!json.containsKey('gallery')) {
      throw Exception('Missing field: gallery');
    }

    List<String> gallery = [];
    if (json["gallery"] != null && json["gallery"] is List<dynamic>) {
      gallery = List<String>.from(json["gallery"].map((x) => x as String));
    }

    return NewStory(
      id: json['id'],
      createAt: DateTime.parse(json['created_at']),
      description: json['description'],
      gallery: gallery,
    );
  }
}

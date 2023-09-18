class Post {
  String posterName;
  String? posterImage;
  String description;
  List<String> gallery;
  DateTime createAt;
  int id;

  Post({
    required this.id,
    required this.posterName,
    required this.posterImage,
    required this.gallery,
    required this.description,
    required this.createAt,
  });

  static Post fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('id')) {
      throw Exception('Missing field: id');
    }
    if (!json.containsKey('created_at')) {
      throw Exception('Missing field: created_at');
    }
    if (!json.containsKey('poster_name')) {
      throw Exception('Missing field: poster_name');
    }
    if (!json.containsKey('poster_image')) {
      throw Exception('Missing field: poster_image');
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

    int id = json['id'] ?? 0;

    return Post(
      id: id,
      createAt: DateTime.parse(json['created_at']),
      posterName: json['poster_name'],
      posterImage: json['poster_image'],
      description: json['description'],
      gallery: gallery,
    );
  }
}

class NewPost {
  String description;
  List<String> gallery;
  DateTime createAt;
  int id;

  NewPost({
    required this.id,
    required this.gallery,
    required this.description,
    required this.createAt,
  });

static NewPost fromJson(Map<String, dynamic> json) {
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

    

    return NewPost(
      id: json['id'],
      createAt: DateTime.parse(json['created_at']),
      description: json['description'],
      gallery: gallery,
    );
  }

}

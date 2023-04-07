import 'dart:convert';

class PostsModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostsModel({this.userId, this.id, this.title, this.body});

  factory PostsModel.fromMap(Map<String, dynamic> data) => PostsModel(
        userId: data['userId'] as int?,
        id: data['id'] as int?,
        title: data['title'] as String?,
        body: data['body'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PostsModel].
  factory PostsModel.fromJson(String data) {
    return PostsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PostsModel] to a JSON string.
  String toJson() => json.encode(toMap());
}

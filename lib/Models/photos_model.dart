import 'dart:convert';

class PhotosModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PhotosModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory PhotosModel.fromMap(Map<String, dynamic> data) => PhotosModel(
        albumId: data['albumId'] as int?,
        id: data['id'] as int?,
        title: data['title'] as String?,
        url: data['url'] as String?,
        thumbnailUrl: data['thumbnailUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'albumId': albumId,
        'id': id,
        'title': title,
        'url': url,
        'thumbnailUrl': thumbnailUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PhotosModel].
  factory PhotosModel.fromJson(String data) {
    return PhotosModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PhotosModel] to a JSON string.
  String toJson() => json.encode(toMap());
}

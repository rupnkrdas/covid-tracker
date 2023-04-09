import 'dart:convert';

class CountryInfo {
  String? flag;

  CountryInfo({
    this.flag,
  });

  factory CountryInfo.fromMap(Map<String, dynamic> data) => CountryInfo(
        flag: data['flag'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'flag': flag,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CountryInfo].
  factory CountryInfo.fromJson(String data) {
    return CountryInfo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CountryInfo] to a JSON string.
  String toJson() => json.encode(toMap());
}

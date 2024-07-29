import 'dart:convert';

class PrayInfo {
  final String headerImagePath;
  final String title;
  final String text;
  PrayInfo({
    required this.headerImagePath,
    required this.title,
    required this.text,
  });
  

  PrayInfo copyWith({
    String? headerImagePath,
    String? title,
    String? text,
  }) {
    return PrayInfo(
      headerImagePath: headerImagePath ?? this.headerImagePath,
      title: title ?? this.title,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'headerImagePath': headerImagePath});
    result.addAll({'title': title});
    result.addAll({'text': text});
  
    return result;
  }

  factory PrayInfo.fromMap(Map<String, dynamic> map) {
    return PrayInfo(
      headerImagePath: map['headerImagePath'] ?? '',
      title: map['title'] ?? '',
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PrayInfo.fromJson(String source) => PrayInfo.fromMap(json.decode(source));

  @override
  String toString() => 'PrayInfo(headerImagePath: $headerImagePath, title: $title, text: $text)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PrayInfo &&
      other.headerImagePath == headerImagePath &&
      other.title == title &&
      other.text == text;
  }

  @override
  int get hashCode => headerImagePath.hashCode ^ title.hashCode ^ text.hashCode;
}

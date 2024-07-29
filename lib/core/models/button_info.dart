import 'dart:convert';

class ButtonInfo {
  final String title;
  final String routePath;
  ButtonInfo({
    required this.title,
    required this.routePath,
  });

  ButtonInfo copyWith({
    String? title,
    String? routePath,
  }) {
    return ButtonInfo(
      title: title ?? this.title,
      routePath: routePath ?? this.routePath,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'routePath': routePath});
  
    return result;
  }

  factory ButtonInfo.fromMap(Map<String, dynamic> map) {
    return ButtonInfo(
      title: map['title'] ?? '',
      routePath: map['routePath'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ButtonInfo.fromJson(String source) =>
      ButtonInfo.fromMap(json.decode(source));

  @override
  String toString() => 'ButtonInfo(title: $title, routePath: $routePath)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ButtonInfo &&
      other.title == title &&
      other.routePath == routePath;
  }

  @override
  int get hashCode => title.hashCode ^ routePath.hashCode;
}

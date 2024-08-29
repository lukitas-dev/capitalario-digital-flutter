import 'dart:convert';

class ButtonInfo {
  final int menuIndex;
  final String title;
  final String routePath;
  ButtonInfo({
    required this.menuIndex,
    required this.title,
    required this.routePath,
  });

  ButtonInfo copyWith({
    int? menuIndex,
    String? title,
    String? routePath,
  }) {
    return ButtonInfo(
      menuIndex: menuIndex ?? this.menuIndex,
      title: title ?? this.title,
      routePath: routePath ?? this.routePath,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'menuIndex': menuIndex});
    result.addAll({'title': title});
    result.addAll({'routePath': routePath});
  
    return result;
  }

  factory ButtonInfo.fromMap(Map<String, dynamic> map) {
    return ButtonInfo(
      menuIndex: map['menuIndex']?.toInt() ?? 0,
      title: map['title'] ?? '',
      routePath: map['routePath'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ButtonInfo.fromJson(String source) =>
      ButtonInfo.fromMap(json.decode(source));

  @override
  String toString() => 'ButtonInfo(menuIndex: $menuIndex, title: $title, routePath: $routePath)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ButtonInfo &&
      other.menuIndex == menuIndex &&
      other.title == title &&
      other.routePath == routePath;
  }

  @override
  int get hashCode => menuIndex.hashCode ^ title.hashCode ^ routePath.hashCode;
}

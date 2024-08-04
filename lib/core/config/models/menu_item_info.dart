import 'dart:convert';

class MenuItemInfo {
  final String title;
  final String routePath;
  final bool isEnabled;
  MenuItemInfo({
    required this.title,
    required this.routePath,
    required this.isEnabled,
  });

  MenuItemInfo copyWith({
    String? title,
    String? routePath,
    bool? isEnabled,
  }) {
    return MenuItemInfo(
      title: title ?? this.title,
      routePath: routePath ?? this.routePath,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'routePath': routePath});
    result.addAll({'isEnabled': isEnabled});

    return result;
  }

  factory MenuItemInfo.fromMap(Map<String, dynamic> map) {
    return MenuItemInfo(
      title: map['title'] ?? '',
      routePath: map['routePath'] ?? '',
      isEnabled: map['isEnabled'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuItemInfo.fromJson(String source) =>
      MenuItemInfo.fromMap(json.decode(source));

  @override
  String toString() =>
      'AppMenuItem(title: $title, routePath: $routePath, isEnabled: $isEnabled)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuItemInfo &&
        other.title == title &&
        other.routePath == routePath &&
        other.isEnabled == isEnabled;
  }

  @override
  int get hashCode => title.hashCode ^ routePath.hashCode ^ isEnabled.hashCode;
}

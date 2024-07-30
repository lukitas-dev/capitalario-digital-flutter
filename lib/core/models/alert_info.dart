import 'dart:convert';

class AlertInfo {
  final String title;
  final String description;
  final String button;
  AlertInfo({
    required this.title,
    required this.description,
    required this.button,
  });

  AlertInfo copyWith({
    String? title,
    String? description,
    String? button,
  }) {
    return AlertInfo(
      title: title ?? this.title,
      description: description ?? this.description,
      button: button ?? this.button,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'button': button});
  
    return result;
  }

  factory AlertInfo.fromMap(Map<String, dynamic> map) {
    return AlertInfo(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      button: map['button'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AlertInfo.fromJson(String source) => AlertInfo.fromMap(json.decode(source));

  @override
  String toString() => 'AlertInfo(title: $title, description: $description, button: $button)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AlertInfo &&
      other.title == title &&
      other.description == description &&
      other.button == button;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ button.hashCode;
}

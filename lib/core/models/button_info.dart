import 'dart:convert';

class ButtonInfo {
  final String title;
  final String textColor;
  final String borderColor;
  final String backgroundColor;
  ButtonInfo({
    required this.title,
    required this.textColor,
    required this.borderColor,
    required this.backgroundColor,
  });

  ButtonInfo copyWith({
    String? title,
    String? textColor,
    String? borderColor,
    String? backgroundColor,
  }) {
    return ButtonInfo(
      title: title ?? this.title,
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'textColor': textColor});
    result.addAll({'borderColor': borderColor});
    result.addAll({'backgroundColor': backgroundColor});

    return result;
  }

  factory ButtonInfo.fromMap(Map<String, dynamic> map) {
    return ButtonInfo(
      title: map['title'] ?? '',
      textColor: map['textColor'] ?? '',
      borderColor: map['borderColor'] ?? '',
      backgroundColor: map['backgroundColor'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ButtonInfo.fromJson(String source) =>
      ButtonInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ButtonInfo(title: $title, textColor: $textColor, borderColor: $borderColor, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ButtonInfo &&
        other.title == title &&
        other.textColor == textColor &&
        other.borderColor == borderColor &&
        other.backgroundColor == backgroundColor;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        textColor.hashCode ^
        borderColor.hashCode ^
        backgroundColor.hashCode;
  }
}

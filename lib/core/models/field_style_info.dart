import 'dart:convert';

class FieldStyleInfo {
  final String arrowColor;
  final String backgroundColor;
  final String textColor;
  final double textSize;
  final String selectionBackgroundColor;
  final String selectionTextColor;
  final double selectionTextSize;
  FieldStyleInfo({
    required this.arrowColor,
    required this.backgroundColor,
    required this.textColor,
    required this.textSize,
    required this.selectionBackgroundColor,
    required this.selectionTextColor,
    required this.selectionTextSize,
  });

  FieldStyleInfo copyWith({
    String? arrowColor,
    String? backgroundColor,
    String? textColor,
    double? textSize,
    String? selectionBackgroundColor,
    String? selectionTextColor,
    double? selectionTextSize,
  }) {
    return FieldStyleInfo(
      arrowColor: arrowColor ?? this.arrowColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      textSize: textSize ?? this.textSize,
      selectionBackgroundColor: selectionBackgroundColor ?? this.selectionBackgroundColor,
      selectionTextColor: selectionTextColor ?? this.selectionTextColor,
      selectionTextSize: selectionTextSize ?? this.selectionTextSize,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'arrowColor': arrowColor});
    result.addAll({'backgroundColor': backgroundColor});
    result.addAll({'textColor': textColor});
    result.addAll({'textSize': textSize});
    result.addAll({'selectionBackgroundColor': selectionBackgroundColor});
    result.addAll({'selectionTextColor': selectionTextColor});
    result.addAll({'selectionTextSize': selectionTextSize});
  
    return result;
  }

  factory FieldStyleInfo.fromMap(Map<String, dynamic> map) {
    return FieldStyleInfo(
      arrowColor: map['arrowColor'] ?? '',
      backgroundColor: map['backgroundColor'] ?? '',
      textColor: map['textColor'] ?? '',
      textSize: map['textSize']?.toDouble() ?? 0.0,
      selectionBackgroundColor: map['selectionBackgroundColor'] ?? '',
      selectionTextColor: map['selectionTextColor'] ?? '',
      selectionTextSize: map['selectionTextSize']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory FieldStyleInfo.fromJson(String source) =>
      FieldStyleInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FieldStyleInfo(arrowColor: $arrowColor, backgroundColor: $backgroundColor, textColor: $textColor, textSize: $textSize, selectionBackgroundColor: $selectionBackgroundColor, selectionTextColor: $selectionTextColor, selectionTextSize: $selectionTextSize)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FieldStyleInfo &&
      other.arrowColor == arrowColor &&
      other.backgroundColor == backgroundColor &&
      other.textColor == textColor &&
      other.textSize == textSize &&
      other.selectionBackgroundColor == selectionBackgroundColor &&
      other.selectionTextColor == selectionTextColor &&
      other.selectionTextSize == selectionTextSize;
  }

  @override
  int get hashCode {
    return arrowColor.hashCode ^
      backgroundColor.hashCode ^
      textColor.hashCode ^
      textSize.hashCode ^
      selectionBackgroundColor.hashCode ^
      selectionTextColor.hashCode ^
      selectionTextSize.hashCode;
  }
}

import 'dart:convert';

class ButtonStyleInfo {
  final String textColor;
  final String borderColor;
  final String backgroundColor;
  final double height;
  final double borderRadius;
  final double textFontSize;
  ButtonStyleInfo({
    required this.textColor,
    required this.borderColor,
    required this.backgroundColor,
    required this.height,
    required this.borderRadius,
    required this.textFontSize,
  });

  ButtonStyleInfo copyWith({
    String? textColor,
    String? borderColor,
    String? backgroundColor,
    double? height,
    double? borderRadius,
    double? textFontSize,
  }) {
    return ButtonStyleInfo(
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      height: height ?? this.height,
      borderRadius: borderRadius ?? this.borderRadius,
      textFontSize: textFontSize ?? this.textFontSize,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'textColor': textColor});
    result.addAll({'borderColor': borderColor});
    result.addAll({'backgroundColor': backgroundColor});
    result.addAll({'height': height});
    result.addAll({'borderRadius': borderRadius});
    result.addAll({'textFontSize': textFontSize});
  
    return result;
  }

  factory ButtonStyleInfo.fromMap(Map<String, dynamic> map) {
    return ButtonStyleInfo(
      textColor: map['textColor'] ?? '',
      borderColor: map['borderColor'] ?? '',
      backgroundColor: map['backgroundColor'] ?? '',
      height: map['height']?.toDouble() ?? 0.0,
      borderRadius: map['borderRadius']?.toDouble() ?? 0.0,
      textFontSize: map['textFontSize']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ButtonStyleInfo.fromJson(String source) => ButtonStyleInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ButtonStyleInfo(textColor: $textColor, borderColor: $borderColor, backgroundColor: $backgroundColor, height: $height, borderRadius: $borderRadius, textFontSize: $textFontSize)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ButtonStyleInfo &&
      other.textColor == textColor &&
      other.borderColor == borderColor &&
      other.backgroundColor == backgroundColor &&
      other.height == height &&
      other.borderRadius == borderRadius &&
      other.textFontSize == textFontSize;
  }

  @override
  int get hashCode {
    return textColor.hashCode ^
      borderColor.hashCode ^
      backgroundColor.hashCode ^
      height.hashCode ^
      borderRadius.hashCode ^
      textFontSize.hashCode;
  }
}

import 'dart:convert';

class NavbarInfo {
  final double titleTextSize;
  final String titleTextColor;
  final String titleOnHoverColor;
  final String dividerColor;
  final double textSize;
  final String textColor;
  final String onHoverColor;
  final String indicationColor;
  NavbarInfo({
    required this.titleTextSize,
    required this.titleTextColor,
    required this.titleOnHoverColor,
    required this.dividerColor,
    required this.textSize,
    required this.textColor,
    required this.onHoverColor,
    required this.indicationColor,
  });

  NavbarInfo copyWith({
    double? titleTextSize,
    String? titleTextColor,
    String? titleOnHoverColor,
    String? dividerColor,
    double? textSize,
    String? textColor,
    String? onHoverColor,
    String? indicationColor,
  }) {
    return NavbarInfo(
      titleTextSize: titleTextSize ?? this.titleTextSize,
      titleTextColor: titleTextColor ?? this.titleTextColor,
      titleOnHoverColor: titleOnHoverColor ?? this.titleOnHoverColor,
      dividerColor: dividerColor ?? this.dividerColor,
      textSize: textSize ?? this.textSize,
      textColor: textColor ?? this.textColor,
      onHoverColor: onHoverColor ?? this.onHoverColor,
      indicationColor: indicationColor ?? this.indicationColor,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'titleTextSize': titleTextSize});
    result.addAll({'titleTextColor': titleTextColor});
    result.addAll({'titleOnHoverColor': titleOnHoverColor});
    result.addAll({'dividerColor': dividerColor});
    result.addAll({'textSize': textSize});
    result.addAll({'textColor': textColor});
    result.addAll({'onHoverColor': onHoverColor});
    result.addAll({'indicationColor': indicationColor});
  
    return result;
  }

  factory NavbarInfo.fromMap(Map<String, dynamic> map) {
    return NavbarInfo(
      titleTextSize: map['titleTextSize']?.toDouble() ?? 0.0,
      titleTextColor: map['titleTextColor'] ?? '',
      titleOnHoverColor: map['titleOnHoverColor'] ?? '',
      dividerColor: map['dividerColor'] ?? '',
      textSize: map['textSize']?.toDouble() ?? 0.0,
      textColor: map['textColor'] ?? '',
      onHoverColor: map['onHoverColor'] ?? '',
      indicationColor: map['indicationColor'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NavbarInfo.fromJson(String source) => NavbarInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NavbarInfo(titleTextSize: $titleTextSize, titleTextColor: $titleTextColor, titleOnHoverColor: $titleOnHoverColor, dividerColor: $dividerColor, textSize: $textSize, textColor: $textColor, onHoverColor: $onHoverColor, indicationColor: $indicationColor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NavbarInfo &&
      other.titleTextSize == titleTextSize &&
      other.titleTextColor == titleTextColor &&
      other.titleOnHoverColor == titleOnHoverColor &&
      other.dividerColor == dividerColor &&
      other.textSize == textSize &&
      other.textColor == textColor &&
      other.onHoverColor == onHoverColor &&
      other.indicationColor == indicationColor;
  }

  @override
  int get hashCode {
    return titleTextSize.hashCode ^
      titleTextColor.hashCode ^
      titleOnHoverColor.hashCode ^
      dividerColor.hashCode ^
      textSize.hashCode ^
      textColor.hashCode ^
      onHoverColor.hashCode ^
      indicationColor.hashCode;
  }
}

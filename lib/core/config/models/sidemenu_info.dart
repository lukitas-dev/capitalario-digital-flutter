import 'dart:convert';

class SideMenuInfo {
  final String backgroundColor;
  final bool showLogo;
  final String homeTitle;
  final String textColor;
  final double textSize;
  SideMenuInfo({
    required this.backgroundColor,
    required this.showLogo,
    required this.homeTitle,
    required this.textColor,
    required this.textSize,
  });

  SideMenuInfo copyWith({
    String? backgroundColor,
    bool? showLogo,
    String? homeTitle,
    String? textColor,
    double? textSize,
  }) {
    return SideMenuInfo(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      showLogo: showLogo ?? this.showLogo,
      homeTitle: homeTitle ?? this.homeTitle,
      textColor: textColor ?? this.textColor,
      textSize: textSize ?? this.textSize,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'backgroundColor': backgroundColor});
    result.addAll({'showLogo': showLogo});
    result.addAll({'homeTitle': homeTitle});
    result.addAll({'textColor': textColor});
    result.addAll({'textSize': textSize});
  
    return result;
  }

  factory SideMenuInfo.fromMap(Map<String, dynamic> map) {
    return SideMenuInfo(
      backgroundColor: map['backgroundColor'] ?? '',
      showLogo: map['showLogo'] ?? false,
      homeTitle: map['homeTitle'] ?? '',
      textColor: map['textColor'] ?? '',
      textSize: map['textSize']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SideMenuInfo.fromJson(String source) =>
      SideMenuInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SideMenuInfo(backgroundColor: $backgroundColor, showLogo: $showLogo, homeTitle: $homeTitle, textColor: $textColor, textSize: $textSize)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SideMenuInfo &&
      other.backgroundColor == backgroundColor &&
      other.showLogo == showLogo &&
      other.homeTitle == homeTitle &&
      other.textColor == textColor &&
      other.textSize == textSize;
  }

  @override
  int get hashCode {
    return backgroundColor.hashCode ^
      showLogo.hashCode ^
      homeTitle.hashCode ^
      textColor.hashCode ^
      textSize.hashCode;
  }
}

import 'dart:convert';

class BottomNavbarInfo {
  final String homeTitle;
  final String backgroundColor;
  final String selectedItemColor;
  final String unselectedItemColor;
  BottomNavbarInfo({
    required this.homeTitle,
    required this.backgroundColor,
    required this.selectedItemColor,
    required this.unselectedItemColor,
  });

  BottomNavbarInfo copyWith({
    String? homeTitle,
    String? backgroundColor,
    String? selectedItemColor,
    String? unselectedItemColor,
  }) {
    return BottomNavbarInfo(
      homeTitle: homeTitle ?? this.homeTitle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedItemColor: selectedItemColor ?? this.selectedItemColor,
      unselectedItemColor: unselectedItemColor ?? this.unselectedItemColor,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'homeTitle': homeTitle});
    result.addAll({'backgroundColor': backgroundColor});
    result.addAll({'selectedItemColor': selectedItemColor});
    result.addAll({'unselectedItemColor': unselectedItemColor});
  
    return result;
  }

  factory BottomNavbarInfo.fromMap(Map<String, dynamic> map) {
    return BottomNavbarInfo(
      homeTitle: map['homeTitle'] ?? '',
      backgroundColor: map['backgroundColor'] ?? '',
      selectedItemColor: map['selectedItemColor'] ?? '',
      unselectedItemColor: map['unselectedItemColor'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BottomNavbarInfo.fromJson(String source) => BottomNavbarInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BottomNavbarInfo(homeTitle: $homeTitle, backgroundColor: $backgroundColor, selectedItemColor: $selectedItemColor, unselectedItemColor: $unselectedItemColor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BottomNavbarInfo &&
      other.homeTitle == homeTitle &&
      other.backgroundColor == backgroundColor &&
      other.selectedItemColor == selectedItemColor &&
      other.unselectedItemColor == unselectedItemColor;
  }

  @override
  int get hashCode {
    return homeTitle.hashCode ^
      backgroundColor.hashCode ^
      selectedItemColor.hashCode ^
      unselectedItemColor.hashCode;
  }
}

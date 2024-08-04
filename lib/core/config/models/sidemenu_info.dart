import 'dart:convert';

class SideMenuInfo {
  final String backgroundColor;
  final bool showLogo;
  final String homeTitle;
  SideMenuInfo({
    required this.backgroundColor,
    required this.showLogo,
    required this.homeTitle,
  });

  SideMenuInfo copyWith({
    String? backgroundColor,
    bool? showLogo,
    String? homeTitle,
  }) {
    return SideMenuInfo(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      showLogo: showLogo ?? this.showLogo,
      homeTitle: homeTitle ?? this.homeTitle,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'backgroundColor': backgroundColor});
    result.addAll({'showLogo': showLogo});
    result.addAll({'homeTitle': homeTitle});
  
    return result;
  }

  factory SideMenuInfo.fromMap(Map<String, dynamic> map) {
    return SideMenuInfo(
      backgroundColor: map['backgroundColor'] ?? '',
      showLogo: map['showLogo'] ?? false,
      homeTitle: map['homeTitle'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SideMenuInfo.fromJson(String source) =>
      SideMenuInfo.fromMap(json.decode(source));

  @override
  String toString() => 'SideMenuInfo(backgroundColor: $backgroundColor, showLogo: $showLogo, homeTitle: $homeTitle)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SideMenuInfo &&
      other.backgroundColor == backgroundColor &&
      other.showLogo == showLogo &&
      other.homeTitle == homeTitle;
  }

  @override
  int get hashCode => backgroundColor.hashCode ^ showLogo.hashCode ^ homeTitle.hashCode;
}

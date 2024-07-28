import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/core/models/button_info.dart';

class HomeInfo {
  final String headerImagePath;
  final String title;
  final String subtitle;
  final String textColor;
  final List<ButtonInfo> buttonList;
  HomeInfo({
    required this.headerImagePath,
    required this.title,
    required this.subtitle,
    required this.textColor,
    required this.buttonList,
  });

  HomeInfo copyWith({
    String? headerImagePath,
    String? title,
    String? subtitle,
    String? textColor,
    List<ButtonInfo>? buttonList,
  }) {
    return HomeInfo(
      headerImagePath: headerImagePath ?? this.headerImagePath,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      textColor: textColor ?? this.textColor,
      buttonList: buttonList ?? this.buttonList,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'headerImagePath': headerImagePath});
    result.addAll({'title': title});
    result.addAll({'subtitle': subtitle});
    result.addAll({'textColor': textColor});
    result.addAll({'buttonList': buttonList.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory HomeInfo.fromMap(Map<String, dynamic> map) {
    return HomeInfo(
      headerImagePath: map['headerImagePath'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      textColor: map['textColor'] ?? '',
      buttonList: List<ButtonInfo>.from(map['buttonList']?.map((x) => ButtonInfo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeInfo.fromJson(String source) =>
      HomeInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HomeInfo(headerImagePath: $headerImagePath, title: $title, subtitle: $subtitle, textColor: $textColor, buttonList: $buttonList)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HomeInfo &&
      other.headerImagePath == headerImagePath &&
      other.title == title &&
      other.subtitle == subtitle &&
      other.textColor == textColor &&
      listEquals(other.buttonList, buttonList);
  }

  @override
  int get hashCode {
    return headerImagePath.hashCode ^
      title.hashCode ^
      subtitle.hashCode ^
      textColor.hashCode ^
      buttonList.hashCode;
  }
}

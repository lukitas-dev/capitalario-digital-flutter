import 'dart:convert';

import 'package:app/core/models/button_info.dart';
import 'package:app/core/models/button_style_info.dart';
import 'package:flutter/foundation.dart';

class ChallengeInfo {
  final String toolbarTitle;
  final String backgroundImagePath;
  final List<ButtonInfo> buttonList;
  final List<ButtonInfo> buttonDetailList;
  final ButtonStyleInfo buttonStyle;
  ChallengeInfo({
    required this.toolbarTitle,
    required this.backgroundImagePath,
    required this.buttonList,
    required this.buttonDetailList,
    required this.buttonStyle,
  });

  ChallengeInfo copyWith({
    String? toolbarTitle,
    String? backgroundImagePath,
    List<ButtonInfo>? buttonList,
    List<ButtonInfo>? buttonDetailList,
    ButtonStyleInfo? buttonStyle,
  }) {
    return ChallengeInfo(
      toolbarTitle: toolbarTitle ?? this.toolbarTitle,
      backgroundImagePath: backgroundImagePath ?? this.backgroundImagePath,
      buttonList: buttonList ?? this.buttonList,
      buttonDetailList: buttonDetailList ?? this.buttonDetailList,
      buttonStyle: buttonStyle ?? this.buttonStyle,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'toolbarTitle': toolbarTitle});
    result.addAll({'backgroundImagePath': backgroundImagePath});
    result.addAll({'buttonList': buttonList.map((x) => x.toMap()).toList()});
    result.addAll({'buttonDetailList': buttonDetailList.map((x) => x.toMap()).toList()});
    result.addAll({'buttonStyle': buttonStyle.toMap()});
  
    return result;
  }

  factory ChallengeInfo.fromMap(Map<String, dynamic> map) {
    return ChallengeInfo(
      toolbarTitle: map['toolbarTitle'] ?? '',
      backgroundImagePath: map['backgroundImagePath'] ?? '',
      buttonList: List<ButtonInfo>.from(map['buttonList']?.map((x) => ButtonInfo.fromMap(x))),
      buttonDetailList: List<ButtonInfo>.from(map['buttonDetailList']?.map((x) => ButtonInfo.fromMap(x))),
      buttonStyle: ButtonStyleInfo.fromMap(map['buttonStyle']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChallengeInfo.fromJson(String source) => ChallengeInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChallengeInfo(toolbarTitle: $toolbarTitle, backgroundImagePath: $backgroundImagePath, buttonList: $buttonList, buttonDetailList: $buttonDetailList, buttonStyle: $buttonStyle)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ChallengeInfo &&
      other.toolbarTitle == toolbarTitle &&
      other.backgroundImagePath == backgroundImagePath &&
      listEquals(other.buttonList, buttonList) &&
      listEquals(other.buttonDetailList, buttonDetailList) &&
      other.buttonStyle == buttonStyle;
  }

  @override
  int get hashCode {
    return toolbarTitle.hashCode ^
      backgroundImagePath.hashCode ^
      buttonList.hashCode ^
      buttonDetailList.hashCode ^
      buttonStyle.hashCode;
  }
}

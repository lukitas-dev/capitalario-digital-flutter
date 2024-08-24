import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/core/models/button_info.dart';
import 'package:app/core/models/button_style_info.dart';

class LightInfo {
  final String toolbarTitle;
  final List<ButtonInfo> buttonList;
  final ButtonStyleInfo buttonStyle;
  LightInfo({
    required this.toolbarTitle,
    required this.buttonList,
    required this.buttonStyle,
  });

  LightInfo copyWith({
    String? toolbarTitle,
    List<ButtonInfo>? buttonList,
    ButtonStyleInfo? buttonStyle,
  }) {
    return LightInfo(
      toolbarTitle: toolbarTitle ?? this.toolbarTitle,
      buttonList: buttonList ?? this.buttonList,
      buttonStyle: buttonStyle ?? this.buttonStyle,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'toolbarTitle': toolbarTitle});
    result.addAll({'buttonList': buttonList.map((x) => x.toMap()).toList()});
    result.addAll({'buttonStyle': buttonStyle.toMap()});
  
    return result;
  }

  factory LightInfo.fromMap(Map<String, dynamic> map) {
    return LightInfo(
      toolbarTitle: map['toolbarTitle'] ?? '',
      buttonList: List<ButtonInfo>.from(map['buttonList']?.map((x) => ButtonInfo.fromMap(x))),
      buttonStyle: ButtonStyleInfo.fromMap(map['buttonStyle']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LightInfo.fromJson(String source) => LightInfo.fromMap(json.decode(source));

  @override
  String toString() => 'LightInfo(toolbarTitle: $toolbarTitle, buttonList: $buttonList, buttonStyle: $buttonStyle)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LightInfo &&
      other.toolbarTitle == toolbarTitle &&
      listEquals(other.buttonList, buttonList) &&
      other.buttonStyle == buttonStyle;
  }

  @override
  int get hashCode => toolbarTitle.hashCode ^ buttonList.hashCode ^ buttonStyle.hashCode;
}

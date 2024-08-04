import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app/core/config/models/menu_item_info.dart';
import 'package:app/core/config/models/sidemenu_info.dart';

class SettingsInfo {
  final String name;
  final String backgroundColor;
  final String toolbarBackgroundColor;
  final bool isSideMenuEnabled;
  final SideMenuInfo sideMenuInfo;
  final List<MenuItemInfo> menuItemList;
  SettingsInfo({
    required this.name,
    required this.backgroundColor,
    required this.toolbarBackgroundColor,
    required this.isSideMenuEnabled,
    required this.sideMenuInfo,
    required this.menuItemList,
  });

  SettingsInfo copyWith({
    String? name,
    String? backgroundColor,
    String? toolbarBackgroundColor,
    bool? isSideMenuEnabled,
    SideMenuInfo? sideMenuInfo,
    List<MenuItemInfo>? menuItemList,
  }) {
    return SettingsInfo(
      name: name ?? this.name,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      toolbarBackgroundColor: toolbarBackgroundColor ?? this.toolbarBackgroundColor,
      isSideMenuEnabled: isSideMenuEnabled ?? this.isSideMenuEnabled,
      sideMenuInfo: sideMenuInfo ?? this.sideMenuInfo,
      menuItemList: menuItemList ?? this.menuItemList,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'name': name});
    result.addAll({'backgroundColor': backgroundColor});
    result.addAll({'toolbarBackgroundColor': toolbarBackgroundColor});
    result.addAll({'isSideMenuEnabled': isSideMenuEnabled});
    result.addAll({'sideMenuInfo': sideMenuInfo.toMap()});
    result.addAll({'menuItemList': menuItemList.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory SettingsInfo.fromMap(Map<String, dynamic> map) {
    return SettingsInfo(
      name: map['name'] ?? '',
      backgroundColor: map['backgroundColor'] ?? '',
      toolbarBackgroundColor: map['toolbarBackgroundColor'] ?? '',
      isSideMenuEnabled: map['isSideMenuEnabled'] ?? false,
      sideMenuInfo: SideMenuInfo.fromMap(map['sideMenuInfo']),
      menuItemList: List<MenuItemInfo>.from(map['menuItemList']?.map((x) => MenuItemInfo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsInfo.fromJson(String source) =>
      SettingsInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SettingsInfo(name: $name, backgroundColor: $backgroundColor, toolbarBackgroundColor: $toolbarBackgroundColor, isSideMenuEnabled: $isSideMenuEnabled, sideMenuInfo: $sideMenuInfo, menuItemList: $menuItemList)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SettingsInfo &&
      other.name == name &&
      other.backgroundColor == backgroundColor &&
      other.toolbarBackgroundColor == toolbarBackgroundColor &&
      other.isSideMenuEnabled == isSideMenuEnabled &&
      other.sideMenuInfo == sideMenuInfo &&
      listEquals(other.menuItemList, menuItemList);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      backgroundColor.hashCode ^
      toolbarBackgroundColor.hashCode ^
      isSideMenuEnabled.hashCode ^
      sideMenuInfo.hashCode ^
      menuItemList.hashCode;
  }
}

import 'dart:convert';

import 'package:app/viewer/models/box_info.dart';

class LiveBox {
  final int current;
  final bool isCompleted;
  final BoxInfo boxInfo;
  LiveBox({
    required this.current,
    required this.isCompleted,
    required this.boxInfo,
  });

  LiveBox copyWith({
    int? current,
    bool? isCompleted,
    BoxInfo? boxInfo,
  }) {
    return LiveBox(
      current: current ?? this.current,
      isCompleted: isCompleted ?? this.isCompleted,
      boxInfo: boxInfo ?? this.boxInfo,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'current': current});
    result.addAll({'isCompleted': isCompleted});
    result.addAll({'boxInfo': boxInfo.toMap()});
  
    return result;
  }

  factory LiveBox.fromMap(Map<String, dynamic> map) {
    return LiveBox(
      current: map['current']?.toInt() ?? 0,
      isCompleted: map['isCompleted'] ?? false,
      boxInfo: BoxInfo.fromMap(map['boxInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LiveBox.fromJson(String source) => LiveBox.fromMap(json.decode(source));

  @override
  String toString() => 'LiveBox(current: $current, isCompleted: $isCompleted, boxInfo: $boxInfo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LiveBox &&
      other.current == current &&
      other.isCompleted == isCompleted &&
      other.boxInfo == boxInfo;
  }

  @override
  int get hashCode => current.hashCode ^ isCompleted.hashCode ^ boxInfo.hashCode;
}

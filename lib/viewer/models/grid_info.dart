import 'dart:convert';

class GridInfo {
  final int numberOfRows;
  final int numberOfColumns;
  final int targetDefault;
  GridInfo({
    required this.numberOfRows,
    required this.numberOfColumns,
    required this.targetDefault,
  });

  GridInfo copyWith({
    int? numberOfRows,
    int? numberOfColumns,
    int? targetDefault,
  }) {
    return GridInfo(
      numberOfRows: numberOfRows ?? this.numberOfRows,
      numberOfColumns: numberOfColumns ?? this.numberOfColumns,
      targetDefault: targetDefault ?? this.targetDefault,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'numberOfRows': numberOfRows});
    result.addAll({'numberOfColumns': numberOfColumns});
    result.addAll({'targetDefault': targetDefault});
  
    return result;
  }

  factory GridInfo.fromMap(Map<String, dynamic> map) {
    return GridInfo(
      numberOfRows: map['numberOfRows']?.toInt() ?? 0,
      numberOfColumns: map['numberOfColumns']?.toInt() ?? 0,
      targetDefault: map['targetDefault']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GridInfo.fromJson(String source) => GridInfo.fromMap(json.decode(source));

  @override
  String toString() => 'GridInfo(numberOfRows: $numberOfRows, numberOfColumns: $numberOfColumns, targetDefault: $targetDefault)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GridInfo &&
      other.numberOfRows == numberOfRows &&
      other.numberOfColumns == numberOfColumns &&
      other.targetDefault == targetDefault;
  }

  @override
  int get hashCode => numberOfRows.hashCode ^ numberOfColumns.hashCode ^ targetDefault.hashCode;
}

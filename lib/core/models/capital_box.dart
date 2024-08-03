import 'dart:convert';
import 'dart:ui';

class CapitalBox {
  final int target;
  int current;
  final String imagePath;
  bool isCompleted;

  CapitalBox(
    this.target,
    this.current,
    this.imagePath,
    this.isCompleted,
  );


  Map<String, dynamic> toMap() {
    return {
      'target': target,
      'current': current,
      'imagePath': imagePath,
      'isCompleted': isCompleted,
    };
  }

  factory CapitalBox.fromMap(Map<String, dynamic> map) {
    return CapitalBox(
      map['target'] ?? 0,
      map['current'] ?? 0,
      map['imagePath'] ?? '',
      map['isCompleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CapitalBox.fromJson(String source) =>
      CapitalBox.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CapitalBox(target: $target, current: $current, imagePath: $imagePath, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CapitalBox &&
        o.target == target &&
        o.current == current &&
        o.imagePath == imagePath &&
        o.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return hashList([
      target,
      current,
      imagePath,
      isCompleted,
    ]);
  }
}

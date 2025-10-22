import 'package:uuid/uuid.dart';

enum SubjectType {
  math,
  science,
  english,
  history,
  geography,
  art,
  music,
  physicalEducation,
  foreignLanguage,
  other,
}

class Subject {
  final String id;
  final String name;
  final SubjectType type;
  final String? description;
  final String color; // Hex color code
  final DateTime createdAt;
  final DateTime updatedAt;

  Subject({
    String? id,
    required this.name,
    required this.type,
    this.description,
    required this.color,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Subject copyWith({
    String? name,
    SubjectType? type,
    String? description,
    String? color,
  }) {
    return Subject(
      id: id,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      color: color ?? this.color,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.name,
      'description': description,
      'color': color,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      name: json['name'],
      type: SubjectType.values.firstWhere((e) => e.name == json['type']),
      description: json['description'],
      color: json['color'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
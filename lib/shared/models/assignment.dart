import 'package:uuid/uuid.dart';

enum AssignmentStatus {
  notStarted,
  inProgress,
  completed,
  overdue,
}

enum AssignmentType {
  homework,
  quiz,
  test,
  project,
  reading,
  writing,
  other,
}

class Assignment {
  final String id;
  final String title;
  final String? description;
  final String studentId;
  final String subjectId;
  final AssignmentType type;
  final AssignmentStatus status;
  final DateTime dueDate;
  final DateTime? completedDate;
  final int? grade; // Grade out of 100
  final String? notes;
  final List<String> attachments; // File paths or URLs
  final DateTime createdAt;
  final DateTime updatedAt;

  Assignment({
    String? id,
    required this.title,
    this.description,
    required this.studentId,
    required this.subjectId,
    required this.type,
    this.status = AssignmentStatus.notStarted,
    required this.dueDate,
    this.completedDate,
    this.grade,
    this.notes,
    this.attachments = const [],
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  bool get isOverdue {
    if (status == AssignmentStatus.completed) return false;
    return DateTime.now().isAfter(dueDate);
  }

  bool get isCompleted => status == AssignmentStatus.completed;

  Assignment copyWith({
    String? title,
    String? description,
    String? studentId,
    String? subjectId,
    AssignmentType? type,
    AssignmentStatus? status,
    DateTime? dueDate,
    DateTime? completedDate,
    int? grade,
    String? notes,
    List<String>? attachments,
  }) {
    return Assignment(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      studentId: studentId ?? this.studentId,
      subjectId: subjectId ?? this.subjectId,
      type: type ?? this.type,
      status: status ?? this.status,
      dueDate: dueDate ?? this.dueDate,
      completedDate: completedDate ?? this.completedDate,
      grade: grade ?? this.grade,
      notes: notes ?? this.notes,
      attachments: attachments ?? this.attachments,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'studentId': studentId,
      'subjectId': subjectId,
      'type': type.name,
      'status': status.name,
      'dueDate': dueDate.toIso8601String(),
      'completedDate': completedDate?.toIso8601String(),
      'grade': grade,
      'notes': notes,
      'attachments': attachments,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      studentId: json['studentId'],
      subjectId: json['subjectId'],
      type: AssignmentType.values.firstWhere((e) => e.name == json['type']),
      status: AssignmentStatus.values.firstWhere((e) => e.name == json['status']),
      dueDate: DateTime.parse(json['dueDate']),
      completedDate: json['completedDate'] != null 
          ? DateTime.parse(json['completedDate']) 
          : null,
      grade: json['grade'],
      notes: json['notes'],
      attachments: List<String>.from(json['attachments'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
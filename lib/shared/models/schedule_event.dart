import 'package:uuid/uuid.dart';

enum ScheduleEventType {
  lesson,
  assignment,
  test,
  fieldTrip,
  breakTime,
  other,
}

class ScheduleEvent {
  final String id;
  final String title;
  final String? description;
  final String? studentId; // null for all students
  final String? subjectId;
  final ScheduleEventType type;
  final DateTime startTime;
  final DateTime endTime;
  final bool isRecurring;
  final String? recurrencePattern; // 'daily', 'weekly', 'monthly'
  final List<int>? recurrenceDays; // Days of week (1-7) for weekly
  final DateTime? recurrenceEndDate;
  final String? location;
  final List<String> attachments;
  final DateTime createdAt;
  final DateTime updatedAt;

  ScheduleEvent({
    String? id,
    required this.title,
    this.description,
    this.studentId,
    this.subjectId,
    required this.type,
    required this.startTime,
    required this.endTime,
    this.isRecurring = false,
    this.recurrencePattern,
    this.recurrenceDays,
    this.recurrenceEndDate,
    this.location,
    this.attachments = const [],
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Duration get duration => endTime.difference(startTime);

  bool get isAllDay {
    return startTime.hour == 0 && 
           startTime.minute == 0 && 
           endTime.hour == 23 && 
           endTime.minute == 59;
  }

  bool get isToday {
    final now = DateTime.now();
    return startTime.year == now.year &&
           startTime.month == now.month &&
           startTime.day == now.day;
  }

  ScheduleEvent copyWith({
    String? title,
    String? description,
    String? studentId,
    String? subjectId,
    ScheduleEventType? type,
    DateTime? startTime,
    DateTime? endTime,
    bool? isRecurring,
    String? recurrencePattern,
    List<int>? recurrenceDays,
    DateTime? recurrenceEndDate,
    String? location,
    List<String>? attachments,
  }) {
    return ScheduleEvent(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      studentId: studentId ?? this.studentId,
      subjectId: subjectId ?? this.subjectId,
      type: type ?? this.type,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isRecurring: isRecurring ?? this.isRecurring,
      recurrencePattern: recurrencePattern ?? this.recurrencePattern,
      recurrenceDays: recurrenceDays ?? this.recurrenceDays,
      recurrenceEndDate: recurrenceEndDate ?? this.recurrenceEndDate,
      location: location ?? this.location,
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
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'isRecurring': isRecurring,
      'recurrencePattern': recurrencePattern,
      'recurrenceDays': recurrenceDays,
      'recurrenceEndDate': recurrenceEndDate?.toIso8601String(),
      'location': location,
      'attachments': attachments,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory ScheduleEvent.fromJson(Map<String, dynamic> json) {
    return ScheduleEvent(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      studentId: json['studentId'],
      subjectId: json['subjectId'],
      type: ScheduleEventType.values.firstWhere((e) => e.name == json['type']),
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      isRecurring: json['isRecurring'] ?? false,
      recurrencePattern: json['recurrencePattern'],
      recurrenceDays: json['recurrenceDays'] != null 
          ? List<int>.from(json['recurrenceDays']) 
          : null,
      recurrenceEndDate: json['recurrenceEndDate'] != null 
          ? DateTime.parse(json['recurrenceEndDate']) 
          : null,
      location: json['location'],
      attachments: List<String>.from(json['attachments'] ?? []),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
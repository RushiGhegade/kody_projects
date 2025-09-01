class Task {
  final String id;
  final String title;
  final String dis;
  final String time;
  final String date;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.time,
    required this.dis,
    required this.date,
    this.isCompleted = false,
  });

  Task copyWith({
    String? title,
    String? dis,
    String? time,
    String? date,
    bool? isCompleted,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      dis: dis ?? this.dis,
      date: date ?? this.date,
      time: time ?? this.time,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'dis': dis,
      'time': time,
      'date': date,
      'isCompleted': isCompleted,
    };
  }
}

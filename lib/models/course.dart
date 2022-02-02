class Course {
  int? id;
  String name;
  String teacher;
  String code;
  String semester;
  List<int> weeks;
  int weekday;
  int start;
  int step;
  bool selfAdd;

  Course({
    this.id,
    required this.name,
    required this.teacher,
    required this.code,
    required this.semester,
    required this.weeks,
    required this.weekday,
    required this.start,
    required this.step,
    this.selfAdd = false,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'teacher': teacher,
      'code': code,
      'semester': semester,
      'weeks': weeks.toString(),
      'weekday': weekday,
      'start': start,
      'step': step,
      'selfAdd': selfAdd ? 1 : 0,
    };
  }

  Course.fromMap(Map<String, Object?> map)
      : id = map['id'] as int?,
        name = map['name'] as String,
        teacher = map['teacher'] as String,
        code = map['code'] as String,
        semester = map['semester'] as String,
        weeks = (map['weeks'] as String)
            .split(',')
            .map((e) => int.parse(e))
            .toList(),
        weekday = map['weekday'] as int,
        start = map['start'] as int,
        step = map['step'] as int,
        selfAdd = map['selfAdd'] as int == 1;
}

class CourseTime {
  int? id;

  List<int> weeks;
  int weekday;
  int start;
  int step;

  CourseTime({
    this.id,
    required this.weeks,
    required this.weekday,
    required this.start,
    required this.step,
  });
}

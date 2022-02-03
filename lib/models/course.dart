import 'package:hithere/views/schedule/course.dart';

class Course extends ScheduleCourse {
  int? id;
  @override
  String name;
  @override
  String teacher;
  @override
  String room;
  String code;
  String semester;
  List<int> weeks;
  int weekday;
  @override
  int start;
  @override
  int step;
  bool selfAdd;

  Course({
    this.id,
    required this.name,
    required this.teacher,
    required this.room,
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
      'room': room,
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
        room = map['room'] as String,
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

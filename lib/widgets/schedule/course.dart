enum ProcessedCourseType {
  course,
  empty,
}

class ProcessedCourse {
  final ProcessedCourseType type;
  final List<ScheduleCourse> courses;

  ProcessedCourse(this.type, this.courses);
}

abstract class ScheduleCourse {
  int get start;

  int get step;

  String get name;

  String get room;

  String get teacher;

  int get weekday;
}

class EmptyCourse extends ScheduleCourse {
  @override
  final int start;
  @override
  final int step;

  EmptyCourse({required this.start, required this.step});

  @override
  String get name => '';

  @override
  String get room => '';

  @override
  String get teacher => '';

  @override
  int get weekday => 0;
}

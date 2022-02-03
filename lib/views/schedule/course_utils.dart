import 'package:hithere/views/schedule/course.dart';

abstract class CourseUtils {
  static List<ProcessedCourse> getProcessedCourses(
    List<ScheduleCourse> courses,
    int rowCount,
  ) {
    return processOverlayCourses(courses, rowCount);
  }

  static List<ProcessedCourse> processOverlayCourses(
    List<ScheduleCourse> courses,
    int rowCount,
  ) {
    if (courses.isEmpty) {
      return [];
    }

    courses.sort((a, b) => a.start - b.start);

    var ret = <ProcessedCourse>[];
    var map = <String, ProcessedCourse>{};

    for (var course in courses) {
      var key = '${course.start}-${course.step}';
      if (map.containsKey(key)) {
        map[key] = ProcessedCourse(ProcessedCourseType.course, []);
      }

      map[key]!.courses.add(course);
    }

    for (int start = 1; start <= rowCount; start++) {
      for (int step = 1; step <= rowCount; step++) {
        if (!map.containsKey('$start-$step')) {
          continue;
        }

        if (map['$start-$step']!.courses.first is EmptyCourse) {
          ret.add(ProcessedCourse(
              ProcessedCourseType.empty, map['$start-$step']!.courses));

          continue;
        }

        ret.add(map['$start-$step']!);
      }
    }

    return ret;
  }

  /// fill courses with [EmptyCourse]
  static List<ScheduleCourse> getFilledCourses(
    List<ScheduleCourse> courses,
    int rowCount,
  ) {
    if (courses.isEmpty) return [];

    int prevStart = 0;
    int prevStep = 0;

    var ret = <ScheduleCourse>[];

    for (var course in courses) {
      if (course.start > prevStart + prevStep) {
        ret.add(EmptyCourse(
            start: prevStart + prevStep,
            step: course.start - (prevStart + prevStep)));
        prevStart = prevStart + prevStep - (prevStart + prevStep);
        prevStep = course.step;
      } else {
        prevStart = course.start;
        prevStep = course.step;
      }

      ret.add(course);
    }

    if (prevStart + prevStep - 1 < rowCount) {
      ret.add(EmptyCourse(
          start: prevStart + prevStep,
          step: rowCount - (prevStart + prevStep) + 1));
    }

    return ret;
  }

  /// sort courses by start time
  static List<ScheduleCourse> getSortedValidCourses(
    List<ScheduleCourse> courses,
    int rowCount,
  ) {
    if (courses.isEmpty) return [];

    var ret = getValidCourses(courses, rowCount);
    ret.sort((a, b) => a.start - b.start);
    return ret;
  }

  /// check course conflicts
  static List<ScheduleCourse> getValidCourses(
    List<ScheduleCourse> courses,
    int rowCount,
  ) {
    if (courses.isEmpty) return [];

    List<ScheduleCourse> ret = List.of(courses);

    ret.removeWhere((e) {
      return (e.start < 1) || (e.step < 1) || (e.start + e.step - 1 > rowCount);
    });

    return ret;
  }
}

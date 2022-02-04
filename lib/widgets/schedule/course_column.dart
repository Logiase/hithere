import 'package:flutter/material.dart';

import './course.dart';
import './course_item.dart';
import './course_utils.dart';

class CourseColumn extends StatelessWidget {
  final double height;
  final int rowCount;
  final List<ScheduleCourse> courses;

  const CourseColumn({
    Key? key,
    required this.height,
    required this.rowCount,
    required this.courses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double minHeight = height / rowCount;

    var processedCourses = CourseUtils.getProcessedCourses(courses, rowCount);

    var children = <Widget>[];

    for (var e in processedCourses) {
      switch (e.type) {
        case ProcessedCourseType.course:
          children.add(CourseItem(courses: e.courses, minHeight: minHeight));
          break;
        case ProcessedCourseType.empty:
          children.add(EmptyCourseItem(
              start: e.courses[0].start,
              step: e.courses[0].step,
              minHeight: minHeight));
          break;
      }
    }

    return SizedBox(
      height: height,
      child: Column(children: children),
    );
  }
}

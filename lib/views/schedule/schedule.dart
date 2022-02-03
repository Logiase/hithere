import 'package:flutter/material.dart';
import 'package:hithere/views/schedule/content.dart';
import 'package:hithere/views/schedule/course.dart';
import 'package:hithere/views/schedule/weeks.dart';
import 'package:styled_widget/styled_widget.dart';

class Schedule extends StatelessWidget {
  final List<ScheduleCourse> courses;
  final DateTime semesterStartDate;
  final int weekNum;
  final List<String> rowNames;

  const Schedule({
    Key? key,
    required this.courses,
    required this.semesterStartDate,
    required this.weekNum,
    required this.rowNames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Weeks(
        semesterStartDate: semesterStartDate,
        weekNum: weekNum,
      ),
      Content(
        rowNames: rowNames,
        courses: courses,
      ).expanded(),
    ]).padding(vertical: 5.0);
  }
}

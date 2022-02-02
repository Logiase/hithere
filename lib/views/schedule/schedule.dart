import 'package:flutter/material.dart';
import 'package:hithere/models/course.dart';
import 'package:hithere/views/schedule/weeks.dart';
import 'package:styled_widget/styled_widget.dart';

class Schedule extends StatelessWidget {
  final List<Course> courses;
  final DateTime semesterStartDate;
  final int weekNum;

  const Schedule({
    Key? key,
    required this.courses,
    required this.semesterStartDate,
    required this.weekNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Weeks(
        semesterStartDate: semesterStartDate,
        weekNum: weekNum,
      ),
    ]).padding(vertical: 5.0);
  }
}

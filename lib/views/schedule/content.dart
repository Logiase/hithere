import 'package:flutter/material.dart';
import 'package:hithere/views/schedule/course.dart';
import 'package:hithere/views/schedule/course_column.dart';
import 'package:hithere/views/schedule/times.dart';
import 'package:styled_widget/styled_widget.dart';

class Content extends StatelessWidget {
  final List<String> rowNames;

  const Content({
    Key? key,
    required this.rowNames,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double contentHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    var children = <Widget>[];
    children.add(
        Times(rowNames: rowNames, height: contentHeight).expanded(flex: 6));

    for (int i = 1; i <= 7; i++) {
      var weekdayCourses = <ScheduleCourse>[];
      children.add(CourseColumn(
          height: contentHeight,
          rowCount: rowNames.length,
          courses: weekdayCourses).expanded(flex: 7));
    }

    return SingleChildScrollView(child: Row(children: children));
  }
}

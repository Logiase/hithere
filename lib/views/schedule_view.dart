import 'package:flutter/material.dart';
import 'package:hithere/providers/course_provider.dart';
import 'package:hithere/views/schedule/schedule.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courseProviderRef = Provider.of<CourseProvider>(context);

    DateTime startDate = DateTime.now();
    if (startDate.weekday != DateTime.monday) {
      startDate = startDate.subtract(Duration(days: startDate.weekday - DateTime.monday));
    }

    return Schedule(
      courses: courseProviderRef.currentWeekCourses,
      weekNum: 1,
      semesterStartDate: startDate,
    );
  }
}

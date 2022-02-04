import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hithere/widgets/schedule/schedule.dart';
import 'package:hithere/modules/schedule/schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rowNames = ['', '', '', '', '', '', '', '', '', '', '', ''];

    DateTime startDate = DateTime.now();
    if (startDate.weekday != DateTime.monday) {
      startDate = startDate
          .subtract(Duration(days: startDate.weekday - DateTime.monday));
    }

    return Schedule(
        courses: const [],
        semesterStartDate: startDate,
        weekNum: 1,
        rowNames: rowNames);
  }
}

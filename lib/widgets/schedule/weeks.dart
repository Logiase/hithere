import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class Weeks extends StatelessWidget {
  static const List<String> defaultWeekdayNames = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  final List<String> _weekdayNames;
  final DateTime semesterStartDate;
  final int weekNum;

  Weeks({
    Key? key,
    required this.semesterStartDate,
    required this.weekNum,
    List<String> weekdayNames = defaultWeekdayNames,
  })  : _weekdayNames = weekdayNames,
        super(key: key) {
    assert(
      _weekdayNames.length == 7,
      'weekdayNames must have exactly 7 elements',
    );
    assert(
      semesterStartDate.weekday == DateTime.monday,
      'semesterStartDate must be a Monday',
    );
    assert(
      weekNum >= 1,
      'weekNum must be greater than or equal to 1',
    );
  }

  @override
  Widget build(BuildContext context) {
    var itemWidth = double.infinity;

    final weekStartDate =
        semesterStartDate.add(Duration(days: (weekNum - 1) * 7));

    int i = 0;

    return Row(
      children: [
        _buildMonth(
          month: weekStartDate.month.toString() + '月',
          width: itemWidth,
        ).expanded(flex: 6),
        ..._weekdayNames.map(
          (e) {
            var ret = _buildWeekColumn(
                    weekdayName: e +
                        '\n' +
                        weekStartDate.add(Duration(days: i)).day.toString(),
                    width: itemWidth)
                .expanded(flex: 7);
            i++;
            return ret;
          },
        ),
      ],
    );
  }

  Widget _buildMonth({required String month, required double width}) {
    return Column(
      children: [
        SizedBox(
          width: width,
          child: Text(
            month,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildWeekColumn({
    required String weekdayName,
    required double width,
  }) {
    return Column(
      children: [
        SizedBox(
          width: width,
          child: Text(weekdayName, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

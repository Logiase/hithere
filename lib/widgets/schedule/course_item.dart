import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import './course.dart';

class CourseItem extends StatelessWidget {
  final List<ScheduleCourse> courses;
  final double minHeight;

  CourseItem({
    Key? key,
    required this.courses,
    required this.minHeight,
  }) : super(key: key) {
    assert(courses.isNotEmpty, 'courses must not be empty');
  }

  @override
  Widget build(BuildContext context) {
    int maxStart = 0;
    int maxStep = 0;
    final c = courses.reversed;

    for (var e in c) {
      if (e.start > maxStart) {
        maxStart = e.start;
      }
      if (e.step > maxStep) {
        maxStep = e.step;
      }
    }

    var children = <Widget>[];
    for (var e in c) {
      children.add(_buildCourseItemChild(context, e));
    }

    if (c.length > 1) {
      children.add(SizedBox(
        width: double.infinity,
        child: Text(
          '${c.length}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ).decorated(color: Colors.green));
    }

    return SizedBox(
      height: minHeight * maxStep,
      child: GestureDetector(
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: children,
        ),
      ),
    );
  }

  Widget _buildCourseItemChild(BuildContext context, ScheduleCourse course) {
    var minFontSize = 12 *
        MediaQuery.of(context).size.height /
        MediaQuery.of(context).size.width /
        1.5;

    return Container(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        minHeight: double.infinity,
      ),
      margin: const EdgeInsets.all(0.5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5),
      ),
      child: AutoSizeText(
        '${course.name}@${course.room}\n${course.teacher}',
        minFontSize: minFontSize,
        softWrap: true,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class EmptyCourseItem extends StatelessWidget {
  final int start;
  final int step;
  final double minHeight;

  const EmptyCourseItem({
    Key? key,
    required this.start,
    required this.step,
    required this.minHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];

    for (var i = 0; i < step; i++) {
      children.add(SizedBox(
        width: double.infinity,
        height: minHeight,
      ));
    }

    return SizedBox(
      height: minHeight * step,
      child: Column(children: children),
    );
  }
}

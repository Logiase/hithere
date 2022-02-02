import 'package:flutter/material.dart';
import 'package:hithere/data/course_repository.dart';
import 'package:hithere/data/course_service.dart';
import 'package:hithere/models/course.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepository courseRepository;
  final CourseService courseService;

  CourseProvider({
    required this.courseRepository,
    required this.courseService,
  });

  List<Course> _courses = [];
  int _showWeek = 1;

  List<Course> get currentWeekCourses {
    return _courses
        .where((course) => course.weeks.contains(_showWeek))
        .toList();
  }
}

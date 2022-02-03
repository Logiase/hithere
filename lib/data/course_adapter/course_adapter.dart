import 'package:hithere/models/course.dart';

/// Course Adapter for different school location
abstract class CourseAdapter {
  Future<List<Course>> fetchCourses(String semester);
}

/// Course parser interface for remote data
abstract class CourseParser {}

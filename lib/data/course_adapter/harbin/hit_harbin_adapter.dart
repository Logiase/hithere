import 'package:hithere/data/course_adapter/course_adapter.dart';
import 'package:hithere/models/course.dart';

class HitHarbinAdapter extends CourseAdapter {
  String account = '';
  String password = '';

  String token = '';

  @override
  Future<List<Course>> fetchCourses(String semester) async {
    return [];
  }
}

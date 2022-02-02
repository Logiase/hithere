import 'package:hithere/models/course.dart';
import 'package:sqflite/sqflite.dart';

const String _kCourseTableName = 'course';
const String _kColumnId = 'id';
const String _kColumnName = 'name';
const String _kColumnTeacher = 'teacher';
const String _kColumnCode = 'code';
const String _kColumnSemester = 'semester';
const String _kColumnWeeks = 'weeks';
const String _kColumnWeekday = 'weekday';
const String _kColumnStart = 'start';
const String _kColumnStep = 'step';
const String _kColumnSelfAdd = 'self_add';

const String _kCreateCourseTableSql = '''
CREATE TABLE $_kCourseTableName (
  $_kColumnId INTEGER PRIMARY KEY AUTOINCREMENT,
  $_kColumnName TEXT NOT NULL,
  $_kColumnTeacher TEXT NOT NULL,
  $_kColumnCode TEXT NOT NULL,
  $_kColumnSemester TEXT NOT NULL,
  $_kColumnWeeks TEXT NOT NULL,
  $_kColumnWeekday INTEGER NOT NULL,
  $_kColumnStart INTEGER NOT NULL,
  $_kColumnStep INTEGER NOT NULL,
  $_kColumnSelfAdd INTEGER NOT NULL
)
''';

class CourseRepository {
  late Database db;

  Future open() async {
    db = await openDatabase(
      'data/courses.db',
      onCreate: _databaseOnCreate,
      version: 1,
    );
  }

  _databaseOnCreate(Database db, int version) async {
    await db.execute(_kCreateCourseTableSql);
  }

  Future<Course> insert(Course course) async {
    course.id = await db.insert(_kCourseTableName, course.toMap());
    return course;
  }

  Future<Course?> get(int id) async {
    List<Map<String, Object?>> maps = await db.query(_kCourseTableName,
        columns: [
          _kColumnId,
          _kColumnName,
          _kColumnTeacher,
          _kColumnCode,
          _kColumnSemester,
          _kColumnWeeks,
          _kColumnWeekday,
          _kColumnStart,
          _kColumnStep,
          _kColumnSelfAdd,
        ],
        where: '$_kColumnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Course.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db
        .delete(_kCourseTableName, where: '$_kColumnId = ?', whereArgs: [id]);
  }

  Future<int> update(Course course) async {
    return await db.update(_kCourseTableName, course.toMap(),
        where: '$_kColumnId = ?', whereArgs: [course.id]);
  }

  Future close() async => db.close();

  Future<int> deleteSelfAdd() async {
    return await db.delete(_kCourseTableName,
        where: '$_kColumnSelfAdd = ?', whereArgs: [1]);
  }

  Future<List<Course>> insertAll(List<Course> courses) async {
    for (Course course in courses) {
      await insert(course);
    }
    return courses;
  }

  Future<List<Course>> findSemesterCourses(String semester) async {
    List<Map<String, Object?>> maps = await db.query(_kCourseTableName,
        columns: [
          _kColumnId,
          _kColumnName,
          _kColumnTeacher,
          _kColumnCode,
          _kColumnSemester,
          _kColumnWeeks,
          _kColumnWeekday,
          _kColumnStart,
          _kColumnStep,
          _kColumnSelfAdd,
        ],
        where: '$_kColumnSemester = ?',
        whereArgs: [semester]);
    return maps.map((Map<String, Object?> map) => Course.fromMap(map)).toList();
  }
}

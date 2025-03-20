import 'package:w6_hw/EX-1-START-CODE/models/course.dart';
import 'package:w6_hw/EX-1-START-CODE/repositories/course_repository.dart';

class CourseProvider {
  final CourseRepository _repository;

  CourseProvider(this._repository);

  Future<List<Course>> getCourses() async {
    return await _repository.getCourses();
  }

  Future<Course?> getCourseFor(String courseId) async {
    return await _repository.getCourseFor(courseId);
  }

  Future<void> addScore(Course course, CourseScore score) async {
    await _repository.addCourseScore(course, score);
  }
}

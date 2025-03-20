import 'package:w6_hw/EX-1-START-CODE/models/course.dart';

abstract class CourseRepository {
  Future<List<Course>> getCourses(); // Use Future for async operations
  Future<Course?> getCourseFor(
    String courseId,
  ); // Nullable return type for not found
  Future<void> addCourseScore(
    Course course,
    CourseScore score,
  ); // Clearer method name
}

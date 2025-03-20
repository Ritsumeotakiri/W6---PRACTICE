import 'dart:async';
import 'package:w6_hw/EX-1-START-CODE/models/course.dart';

import 'course_repository.dart';

class CourseMockRepository implements CourseRepository {
  @override
  Future<void> addCourseScore(Course course, CourseScore score) async {
    await Future.delayed(const Duration(seconds: 1));
    course.scores.add(score);
  }

  @override
  Future<List<Course>> getCourses() async {
    await Future.delayed(const Duration(seconds: 1));
    return _courses;
  }

  @override
  Future<Course?> getCourseFor(String courseId) async {
    await Future.delayed(const Duration(seconds: 1));
    return _courses.firstWhere((course) => course.name == courseId);
  }

  final List<Course> _courses = [
    Course(name: 'Introduction to Programming'),
    Course(name: 'Data Structures and Algorithms'),
    Course(name: 'Software Engineering'),
  ];

  CourseMockRepository() {
    _courses[0].addScore(CourseScore(studentName: 'Alice', studenScore: 90));
    _courses[0].addScore(CourseScore(studentName: 'Bob', studenScore: 80));
    _courses[0].addScore(CourseScore(studentName: 'Charlie', studenScore: 70));
    _courses[1].addScore(CourseScore(studentName: 'Alice', studenScore: 85));
    _courses[1].addScore(CourseScore(studentName: 'Bob', studenScore: 75));
    _courses[1].addScore(CourseScore(studentName: 'Charlie', studenScore: 65));
    _courses[2].addScore(CourseScore(studentName: 'Alice', studenScore: 95));
    _courses[2].addScore(CourseScore(studentName: 'Bob', studenScore: 85));
    _courses[2].addScore(CourseScore(studentName: 'Charlie', studenScore: 75));
  }
}

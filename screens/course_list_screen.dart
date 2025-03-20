import 'package:flutter/material.dart';
import 'package:w6_hw/EX-1-START-CODE/providers/course_provider.dart';
import 'package:w6_hw/EX-1-START-CODE/repositories/course_mock_repository.dart';
import '../models/course.dart';
import 'course_screen.dart';

const Color mainColor = Colors.blue;

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  // final List<Course> _allCourses = [Course(name: 'HTML'), Course(name: 'JAVA')];
  late CourseProvider _courseProvider = CourseProvider(CourseMockRepository());
  List<Course> _allCourses = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _courseProvider = CourseProvider(CourseMockRepository());
    _fetchCourses();
  }

  Future<void> _fetchCourses() async {
    _allCourses = await _courseProvider.getCourses();
    setState(() {
      _isLoading = false;
    });
  }

  void _editCourse(Course course) async {
    await Navigator.of(context).push<Course>(
      MaterialPageRoute(builder: (ctx) => CourseScreen(course: course)),
    );

    _fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('SCORE APP', style: TextStyle(color: Colors.white)),
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: _allCourses.length,
                itemBuilder:
                    (ctx, index) => Dismissible(
                      key: Key(_allCourses[index].name),
                      child: CourseTile(
                        course: _allCourses[index],
                        onEdit: _editCourse,
                      ),
                    ),
              ),
    );
  }
}

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course, required this.onEdit});

  final Course course;
  final Function(Course) onEdit;

  int get numberOfScores => course.scores.length;

  String get numberText {
    return course.hasScore ? "$numberOfScores scores" : 'No score';
  }

  String get averageText {
    String average = course.average.toStringAsFixed(1);
    return course.hasScore ? "Average : $average" : '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () => onEdit(course),
            title: Text(course.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(numberText), Text(averageText)],
            ),
          ),
        ),
      ),
    );
  }
}

import './course.dart';

class Student {
  String name;
  int code;
  List<Course> courses;
  Student(this.courses, this.code, this.name);
  /*= [
    Course(
      courseName: 'Software Engineering',
      courseCode: 'CSE211',
      courseDescription:
          'Software engineering is a branch of computer science which includes a lot Software engineer is a branch of computer science which includes a lot.',
      courseCreditHours: '20',
    ),
    Course(
      courseName: 'Software',
      courseCode: 'CSE311',
      courseDescription: 'XXXXXXX',
      courseCreditHours: '20',
    ),
  ];*/
  void addCourse(Course cr) {
    courses.add(cr);
  }
}

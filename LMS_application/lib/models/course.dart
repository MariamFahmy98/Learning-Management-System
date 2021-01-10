import './student.dart';
import 'QuizQuestion.dart';

class Course {
  String courseName;
  String courseCode;
  String courseDescription;
  String courseCreditHours;
  List<QuizQuestion> quizes;
  List<Student> requests;

  Course({
    this.courseCode,
    this.courseCreditHours,
    this.courseDescription,
    this.courseName,
  });

  void studentRequest(Student input) {
    requests = [input];

    teacherApprove(input);
  }

  void teacherApprove(Student input) {
    //TO DO
    // input.addCourse(this);

    /* requests.removeWhere((student) {
      return student.code == input.code;
    });*/
  }
}

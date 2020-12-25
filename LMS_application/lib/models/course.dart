import './student.dart';
import './quiz.dart';

class Course {
  String courseName;
  String courseCode;
  String courseDescription;
  String courseCreditHours;
  List<Quiz> quizes;
  List<Student> requests;

  Course(this.courseCode);

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

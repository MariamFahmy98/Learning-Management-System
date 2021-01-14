import './student.dart';
import './quiz.dart';

class Course {
  String courseName;
  String courseCode;
  String courseDescription;
  String courseCreditHours;
  List<Quiz> quizes;
  List<String> requests;

  Course({
    this.courseCode,
    this.courseCreditHours,
    this.courseDescription,
    this.courseName,
<<<<<<< HEAD
=======
    this.requests,
>>>>>>> sharnoby
  });

  void studentRequest(Student input) {
    // requests = [input];

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
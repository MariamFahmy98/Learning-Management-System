class QuizQuestion {
  String question,
      option1,
      option2,
      option3,
      option4,
      quizId,
      duration,
      correctOption;
  bool answered = false;
  bool isCorrect = false;

  QuizQuestion();

  void setCorrect(bool boolean) {
    isCorrect = boolean;
  }
}

class Quiz {
  String question;
  int hours;
  int minutes;
  int secounds;
  Quiz({this.question, this.hours, this.minutes, this.secounds});

  void setQuizDuration({int h, int m, int s}) {
    secounds = s;
    hours = h;
    minutes = m;
  }
}

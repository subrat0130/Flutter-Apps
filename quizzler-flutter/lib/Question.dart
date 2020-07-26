class Question {
  String _question;
  bool _answer;
  Question(String question, bool answer) {
    this._question = question;
    this._answer = answer;
  }

  String text() {
    return this._question;
  }

  bool value() {
    return this._answer;
  }
}

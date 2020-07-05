// this class will have the properties that all questions
// should have, The questionText, and questionAnswer

class Question {
  String questionText;
  bool questionAnswer;

  // give these variables a value when we create a new question
  // using a constructor

  Question({String q, bool a}) {
    questionText = q;
    questionAnswer = a;
  }
  //now we can use the constructor to create a new question object in our main.dart
}

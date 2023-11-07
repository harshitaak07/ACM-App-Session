// ignore: camel_case_types
class model {
  // ignore: non_constant_identifier_names
  String? Topic;
  String? difficulty;
  String? question;
  String? correctAnswer;
  List<String>? options;


  model(
      // ignore: non_constant_identifier_names
      {this.Topic,
      this.difficulty,
      this.question,
      this.correctAnswer,
      this.options});

  model.fromJson(Map<String, dynamic> json) {
    Topic = json['Topic'];
    difficulty = json['difficulty'];
    question = json['question'];
    correctAnswer = json['correct_answer'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Topic'] = Topic;
    data['difficulty'] = difficulty;
    data['question'] = question;
    data['correct_answer'] = correctAnswer;
    data['options'] = options;
    return data;
  }
}
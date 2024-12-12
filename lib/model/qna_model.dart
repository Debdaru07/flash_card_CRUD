class QNAModel {
  String question;
  String answer;

  QNAModel({
    required this.question,
    required this.answer
  });

  toJson() {
    return {
      'question': question,
      'answer': answer
    };
  }

  fromJson(Map<String, String> data){
    return QNAModel(
      question: data['question'] ?? '', 
      answer: data['answer'] ?? ''
    );
  }
}
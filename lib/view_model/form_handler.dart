import 'package:flutter/material.dart';

import '../model/qna_model.dart';

class FormHandler with ChangeNotifier{
  List<QNAModel> _cardItems = [];
  List<QNAModel> get cardItems => _cardItems;

  final TextEditingController question = TextEditingController();
  final TextEditingController answer = TextEditingController();

  void resetFields() {
    question.clear();
    answer.clear();
    notifyListeners();
  }

  void applyFunc() {
    if(question.text.isEmpty) {
      // Error, Question is needed
    } else if(answer.text.isEmpty) {
      // Error, Answer is needed
    } else {
      // Show Success Message
      _cardItems.add(QNAModel(question: question.text,answer: answer.text));
    }
  }

  initEmpty() {
   _cardItems.clear(); 
    notifyListeners();
  }

  init5RandomQnAs(){
    _cardItems = [
      QNAModel(question: "What is the capital of India?", answer: "New Delhi"),
      QNAModel(question: "What is the largest country in the world by land area?", answer: "Russia"),
      QNAModel(question: "What is the tallest land animal?", answer: "Giraffe"),
      QNAModel(question: "What is the fastest land animal?", answer: "Cheetah"),
      QNAModel(question: "What is the largest organ in the human body?", answer: "Liver"),
      QNAModel(question: "What is the smallest country in the world?", answer: "Vatican City"),
      QNAModel(question: "What is the largest ocean in the world?", answer: "Pacific Ocean")
    ];
  }
 
}
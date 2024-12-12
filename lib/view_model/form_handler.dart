import 'package:flutter/material.dart';

import '../model/qna_model.dart';
import 'populate_data.dart';

class FormHandler with ChangeNotifier{
  List<QNAModel> _cardItems = returnQuestions;
  List<QNAModel> get cardItems => _cardItems;

  final TextEditingController question = TextEditingController();
  final TextEditingController answer = TextEditingController();

  void resetFields() {
    question.clear();
    answer.clear();
    notifyListeners();
  }

  void dispose() {
    question.clear();
    answer.clear();
  }

  initializeItemsForUpdate(QNAModel? item) {
    question.text = item?.question ?? '';
    answer.text = item?.answer ?? '';
    notifyListeners();
  }

  void applyFunc({QNAModel? qa}) {
    if(question.text.isEmpty) {
      // Error, Question is needed
    } else if(answer.text.isEmpty) {
      // Error, Answer is needed
    } else {
      // Show Success Message
      if(qa == null) {
        _cardItems.add(QNAModel(question: question.text,answer: answer.text));
      } else {
        int index = _cardItems.indexWhere((item) => item.question == qa.question);
        if (index != -1) {
          List<QNAModel> updatedItems = List.from(_cardItems);
          updatedItems[index] = qa;
          _cardItems = updatedItems;
          notifyListeners();
        }
      }
    }
  }

  initEmpty() {
   _cardItems.clear(); 
    notifyListeners();
  }
  
}
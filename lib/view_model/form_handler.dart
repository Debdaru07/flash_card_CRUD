import 'package:flutter/material.dart';

import '../helper_widgets/snack_bar.dart';
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

  dispose() {
    question.clear();
    answer.clear();
  }

  initializeItemsForUpdate(QNAModel? item) {
    question.text = item?.question ?? '';
    answer.text = item?.answer ?? '';
    notifyListeners();
  }

  void applyFunc(context,{QNAModel? qa}) {
    if(question.text.isEmpty) {
      showCustomSnackbar(context, text: 'Question is a required field',isSuccess: false);
    } else if(answer.text.isEmpty) {
      showCustomSnackbar(context, text: 'Answer is a required field',isSuccess: false);
    } else {
      // Show Success Message
      if(qa == null) {
        _cardItems.add(QNAModel(question: question.text,answer: answer.text));
        showCustomSnackbar(context, text: 'Added successfully',isSuccess: true);
        
      } else {
        int index = _cardItems.indexWhere((item) => item.question == qa.question);
        if (index != -1) {
          List<QNAModel> updatedItems = List.from(_cardItems);
          updatedItems[index] = qa;
          _cardItems = updatedItems;
          notifyListeners();
        }
        showCustomSnackbar(context, text: 'Updated successfully',isSuccess: true);
      }
    }
  }

  initEmpty() {
   _cardItems.clear(); 
    notifyListeners();
  }
  
}
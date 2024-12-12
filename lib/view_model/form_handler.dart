import 'package:flutter/material.dart';

import '../helper_widgets/snack_bar.dart';
import '../model/qna_model.dart';
import 'populate_data.dart';

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
        returnQuestions.add(QNAModel(question: question.text,answer: answer.text));
        showCustomSnackbar(context, text: 'Added successfully',isSuccess: true);
        
      } else {
        int index = returnQuestions.indexWhere((item) => item.question == qa.question);
        if (index != -1) {
          List<QNAModel> updatedItems = List.from(returnQuestions);
          updatedItems[index] = qa;
          returnQuestions = updatedItems;
        }
        showCustomSnackbar(context, text: 'Updated successfully',isSuccess: true);
        notifyListeners();
      }
    }  
  }

  initEmpty() {
   _cardItems.clear(); 
    notifyListeners();
  }

  initFields9() {
    _cardItems = returnQuestions;
    notifyListeners();
  }
  
}
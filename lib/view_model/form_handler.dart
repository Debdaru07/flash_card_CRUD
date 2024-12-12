import 'package:flutter/material.dart';

class FormHandler with ChangeNotifier{
  final TextEditingController question = TextEditingController();
  final TextEditingController answer = TextEditingController();

  void resetFields() {
    question.clear();
    answer.clear();
  }

  void applyFunc() {
    if(question.text.isEmpty) {
      // Question is needed
    } else if(answer.text.isEmpty) {
      // Answer is needed
    } else {
      // Success
    }
  }
 
}
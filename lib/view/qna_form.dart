import 'package:flutter/material.dart';

import '../model/qna_model.dart';

class QnAForm extends StatefulWidget {
  final QNAModel? item;
  const QnAForm({super.key, this.item});

  @override
  State<QnAForm> createState() => _QnAFormState();
}

class _QnAFormState extends State<QnAForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...header,
              
            ],
          ),
          
        ),
    );
  }

  List<Widget> get header => [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${widget.item == null ? 'Add' : 'Edit'} Q/A Flash Card', style: const TextStyle(color: Color.fromARGB(255, 3, 73, 130), fontWeight: FontWeight.w600, fontSize: 16),),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.cancel_outlined, size: 20, color: Colors.red,))
        ],
      ),
    ),
    Divider(color: Colors.grey[700],thickness: 0.6,)
  ];
}
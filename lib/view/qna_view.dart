
import 'package:flutter/material.dart';

import 'qna_form.dart';

class QnAView extends StatefulWidget {
  const QnAView({super.key});

  @override
  State<QnAView> createState() => _QnAViewState();
}

class _QnAViewState extends State<QnAView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Center(
          child: Text('Flash Card')
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QnAForm(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
      
    );
  }
}
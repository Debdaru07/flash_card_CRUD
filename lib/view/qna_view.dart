
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/qna_model.dart';
import '../view_model/form_handler.dart';
import 'qna_form.dart';

class QnAView extends StatefulWidget {
  const QnAView({super.key});

  @override
  State<QnAView> createState() => _QnAViewState();
}

class _QnAViewState extends State<QnAView> {
  List<QNAModel> cardItems = [];
  late FormHandler formHandler;

  @override
  void initState() {
    super.initState();
    formHandler = Provider.of<FormHandler>(context, listen: false);
    Future.delayed(Duration.zero, () async => await formHandler.initFields9()); 
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<FormHandler>(
        builder: (context, formHandler, child) => Scaffold(
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(8),
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: formHandler.cardItems.length,
                itemBuilder: (context, index) => QuestionCard(index: index,item: formHandler.cardItems[index],),
                pageSnapping: true,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              var data = Navigator.push(context, MaterialPageRoute( builder: (context) => QnAForm(),));
              if(data!= null){
                
              }
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  

  
}

class QuestionCard extends StatefulWidget {
  final int index; 
  final QNAModel item;
  const QuestionCard({super.key, required this.index, required this.item});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool _showAnswer = false;
  void _toggleAnswer() {
    setState(() {
      _showAnswer = !_showAnswer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleAnswer,
      child: _showAnswer ?
      AnimatedOpacity(
        opacity: _showAnswer ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: answerFlashCard(widget.index, widget.item),
      )
      : eachFlashCard(context,widget.index, widget.item),
    );
  }
}

Widget answerFlashCard(int index, QNAModel item) {
  return Card(
    elevation: 5,
    color: Colors.cyan[50],
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Answer for Question ${index + 1}', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[400]),),
          const Spacer(flex: 1,),
          Text(item.answer, style: TextStyle(fontSize: 18,color: Colors.cyan[700]), maxLines: 3,),
          const Spacer(flex: 3,),
          Text('Tap to go back to the Question', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey[500]),),
        ],
      ),
    ),
  );
}

Widget eachFlashCard(context,int index, QNAModel item) {
  return Card(
    elevation: 5,
    color: Colors.amber[50],
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Question ${index + 1}', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.grey[400]),),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QnAForm(item: item,),),);
                    },
                    child: const Icon(Icons.edit, color: Colors.blue,size: 20,)),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: () {

                    },
                    child: const Icon(Icons.delete, color: Colors.red,size: 20,)),
                ],
              )
            ],
          ),
          const Spacer(flex: 1,),
          Text(item.question, style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.amber[700]), maxLines: 3,),
          const Spacer(flex: 3,),
          Text('Tap to reveal answer', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey[500]),),
          const Spacer(flex: 1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('<<<   Swipe to see other questions   >>>', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[500]),),
            ],
          ),
        ],
      ),
    ),
  );
}
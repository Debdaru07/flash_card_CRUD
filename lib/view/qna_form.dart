import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper_widgets/text_formField.dart';
import '../model/qna_model.dart';
import '../view_model/form_handler.dart';

class QnAForm extends StatefulWidget {
  final QNAModel? item;
  const QnAForm({super.key, this.item});

  @override
  State<QnAForm> createState() => _QnAFormState();
}

class _QnAFormState extends State<QnAForm> {
  late FormHandler formHandler;

  @override
  void initState() {
    formHandler = Provider.of<FormHandler>(context, listen: false);
    if(widget.item != null){
      Future.delayed(Duration.zero, () async {
        await formHandler.initializeItemsForUpdate(widget.item);
      }); 
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    formHandler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<FormHandler>(
        builder: (context, formHandler, child) => Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...header,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                child: Column(
                  children: [
                    buildTextFormField(
                      controller: formHandler.question,
                      hintText: widget.item == null ? 'Question' : (widget.item?.question ?? ''),
                      labelText: widget.item == null ? 'Question' : (widget.item?.question ?? '')
                    ),
                    const SizedBox(height: 16,),
                    buildTextFormField(
                      controller: formHandler.answer,
                      hintText: widget.item == null ? 'Answer' : (widget.item?.answer ?? ''),
                      labelText: widget.item == null ? 'Answer' : (widget.item?.answer ?? '')
                    ),
                  ]
                ),
              )
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    formHandler.resetFields();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red,),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Reset",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    formHandler.applyFunc(qa: widget.item);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 3, 73, 130),),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.item == null ? "Save" : "Update", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),),
                  ),
                ),
              ],
            ),
          ),
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
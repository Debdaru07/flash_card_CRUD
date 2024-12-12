import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/qna_view.dart';
import 'view_model/form_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FormHandler(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true,),
        home: const QnAView(), 
      ),
    );
  }
}

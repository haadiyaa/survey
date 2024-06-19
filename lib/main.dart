import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uitask/home.dart';
import 'package:uitask/survey.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => SurveyModel(),child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SurveyForm(),
    );
  }
}

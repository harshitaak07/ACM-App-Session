import 'package:flutter/material.dart';
import 'package:app_sesh/Screens/answer.dart';
import 'package:app_sesh/Screens/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/answer') {
          final args = settings.arguments;
          if (args is Map<String, dynamic> &&
              args.containsKey('answers') &&
              args.containsKey('quest')) {
            List<String> answers = args['answers'];
            String quest = args['quest'];
            return MaterialPageRoute(
              builder: (context) => Answer(answers: answers, quest: quest),
            );
          }
        } else if (settings.name == '/question') {
          return MaterialPageRoute(
            builder: (context) => const questionr(),
          );
        } // Handle other routes if needed
      },
      debugShowCheckedModeBanner: false,
      home: const questionr(),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:app_sesh/Data/model.dart';
import 'package:app_sesh/Widget/shapechip.dart';
import 'package:google_fonts/google_fonts.dart';

class questionr extends StatefulWidget {
  const questionr({super.key});

  @override
  State<questionr> createState() => _questionrState();
}

// ignore: camel_case_types
class _questionrState extends State<questionr> {
  late Future<List<model>> _questionsFuture;
  List<model> questions = [];

  @override
  void initState() {
    super.initState();
    _questionsFuture = _loadQuestions();
    getQuestions();
  }

  Future<void> getQuestions() async {
    // Load JSON data from assets
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString('assets/questions.json');
    List<dynamic> jsonList = json.decode(jsonData);
    List<model> parsedQuestions =
        jsonList.map((json) => model.fromJson(json)).toList();
    setState(() {
      questions = parsedQuestions;
    });
  }

  Future<List<model>> _loadQuestions() async {
    // Load JSON data from assets
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString('assets/questions.json');
    List<dynamic> jsonList = json.decode(jsonData);
    List<model> parsedQuestions =
        jsonList.map((json) => model.fromJson(json)).toList();
    return parsedQuestions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE2CFEA),
        appBar: AppBar(
          backgroundColor: Color(0xFFA06CD5),
          centerTitle: true,
          title: const Text(
            "My Quiz App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder(
            future: _loadQuestions(),
            builder:
                (BuildContext context, AsyncSnapshot<List<model>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return questionsss(questions);
              } else {
                return const Center(
                  child: Text('Unknown error occurred.'),
                );
              }
            }));
  }

  ListView questionsss(List<model> questions) {
    return ListView.builder(
        itemCount: questions.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: Color(0xFFA06CD5),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          questions[index].question.toString(),
                          style: GoogleFonts.nunito(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      IconButton(
                          icon: const Icon(
                            Icons.arrow_right,
                            color: Colors.black,
                            size: 30.0,
                          ),
                          onPressed: () {
                            List<String>? answers = questions[index].options;
                            String? quest = questions[index].correctAnswer;
                            Navigator.pushNamed(context, '/answer', arguments: {
                              'answers': answers,
                              'quest': quest,
                            });
                          }),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          shapeChip(
                            Label: questions[index].Topic?.toString() ?? 'N/A',
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          shapeChip(
                            Label: questions[index].difficulty.toString(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

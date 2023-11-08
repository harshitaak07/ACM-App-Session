import 'package:app_sesh/Screens/Resscreen.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

// ignore: camel_case_types
class Answer extends StatefulWidget {
  final List<String> answers;
  final String quest;
  const Answer({Key? key, required this.answers, required this.quest})
      : super(key: key);
  @override
  State<Answer> createState() => _AnswerState();
}

// ignore: camel_case_types
class _AnswerState extends State<Answer> {
  Color? tileColor;
  Color? TileColor;
  Set<int> selectedIndices = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE2CFEA),
        body: Column(
          children: [
            const SizedBox(height: 80),
            Align(
              alignment: Alignment.topCenter,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_left,
                  size: 55.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.black,
              ),
            ),
            Expanded(child: getList()),
            Container(
                padding: const EdgeInsets.all(25), child: const LikeButton())
          ],
        ));
  }

  getList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.answers.length,
      itemBuilder: (BuildContext context, int index) {
        bool isCorrectAnswer = widget.answers[index] == widget.quest;
        Color tileColor =
            selectedIndices.contains(index) ? Colors.green : Color(0xFFA06CD5);
        return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
                height: 100.0,
                padding: const EdgeInsets.all(12.0),
                child: ListTile(
                  tileColor: tileColor,
                  onTap: () {
                    setState(() {
                      if (isCorrectAnswer) {
                        selectedIndices.clear();
                        selectedIndices.add(index);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Resscreen(),
                          ),
                        );
                      }
                    });
                    return;
                  },
                  title: Text(
                    widget.answers[index].toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  contentPadding: const EdgeInsets.only(
                      left: 20.0, bottom: 10.0, right: 10.0, top: 10.0),
                )));
      },
    );
  }
}

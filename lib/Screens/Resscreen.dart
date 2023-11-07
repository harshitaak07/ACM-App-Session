import 'package:app_sesh/Screens/question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Resscreen extends StatefulWidget {
  const Resscreen({super.key});

  @override
  State<Resscreen> createState() => _ResscreenState();
}

class _ResscreenState extends State<Resscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2CFEA),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Image.asset('assets/images/correct.png'),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Yay!! You are already a pro!\nTry more questions??',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 76, 76, 76),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton.icon(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xff6247aa))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const questionr()),
                );
              },
              label: const Text(
                "Go Back!!! ",
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

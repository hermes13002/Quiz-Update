import 'package:flutter/material.dart';
import 'package:quiz/section_screens/bible.dart';
import 'package:quiz/section_screens/general.dart';
import 'package:quiz/section_screens/programming.dart';
import 'section_screens/football.dart';

class SectionScreen extends StatefulWidget {
  const SectionScreen({super.key});

  @override
  _SectionScreenState createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
              color: Colors.lightBlueAccent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 7,
          ),
          const Text(
            'Category',
            style: TextStyle(
              fontSize: 27,
              fontFamily: 'Poppins-Bold',
              // color: Colors.white,
              ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Choose Your Preferred Quiz',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w100),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GeneralScreen()));
            },
            child: const SizedBox(
              height: 100,
              width: 200,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.public),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'General Knowledge',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 17,
                          fontFamily: 'Poppins-Bold',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProgrammingScreen()));
            },
            child: Container(
              height: 100,
              width: 200,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: const Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.laptop_chromebook),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Programming',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 19,
                          fontFamily: 'Poppins-Bold',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const BibleScreen()));
            },
            child: Container(
              height: 100,
              width: 200,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: const Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.menu_book),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Bible',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontFamily: 'Poppins-Bold',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FootballScreen()));
            },
            child: Container(
              height: 100,
              width: 200,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: const Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.sports_soccer),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Football',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontFamily: 'Poppins-Bold',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    )));
  }
}

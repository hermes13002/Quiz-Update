// ignore_for_file: library_private_types_in_public_api, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import '../section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({super.key});

  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int totalQuestions = 0;
  int maxAnswered = 15;

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "What is the capital of France?",
      "options": ["Paris", "London", "Berlin", "Rome"],
      "correctAnswer": "Paris"
    },
    {
      "question": "What is the largest ocean in the world?",
      "options": [
        "Pacific Ocean",
        "Atlantic Ocean",
        "Indian Ocean",
        "Arctic Ocean"
      ],
      "correctAnswer": "Pacific Ocean"
    },
    {
      "question": "What is the tallest mountain in the world?",
      "options": ["Mount Everest", "K2", "Kangchenjunga", "Lhotse"],
      "correctAnswer": "Mount Everest"
    },
    {
      "question": "What is the most popular programming language in the world?",
      "options": ["Python", "Java", "JavaScript", "C++"],
      "correctAnswer": "Python"
    },
    {
      "question": "What is the name of the galaxy that we live in?",
      "options": [
        "Milky Way Galaxy",
        "Andromeda Galaxy",
        "Triangulum Galaxy",
        "Large Magellanic Cloud"
      ],
      "correctAnswer": "Milky Way Galaxy"
    },
    {
      "question": "What is the sum of 1 and 1?",
      "options": ["2", "3", "4", "5"],
      "correctAnswer": "2"
    },
    {
      "question": "What is the difference between 10 and 5?",
      "options": ["2", "3", "4", "5"],
      "correctAnswer": "5"
    },
    {
      "question": "What is the product of 2 and 3?",
      "options": ["2", "3", "6", "5"],
      "correctAnswer": "6"
    },
    {
      "question": "What is the quotient of 10 divided by 2?",
      "options": ["2", "3", "4", "5"],
      "correctAnswer": "5"
    },
    {
      "question": "What is the square root of 9?",
      "options": ["2", "3", "4", "5"],
      "correctAnswer": "3"
    },
    {
      "question": "What is the cube root of 27?",
      "options": ["2", "3", "4", "5"],
      "correctAnswer": "3"
    },
    {
      "question": "What is the capital of the United States?",
      "options": [
        "Washington, D.C.",
        "New York City",
        "Los Angeles",
        "Chicago"
      ],
      "correctAnswer": "Washington, D.C."
    },
    {
      "question": "What is the largest country in the world by area?",
      "options": ["Russia", "Canada", "China", "United States"],
      "correctAnswer": "Russia"
    },
    {
      "question": "What is the most populous country in the world?",
      "options": ["China", "India", "United States", "Indonesia"],
      "correctAnswer": "China"
    },
    {
      "question": "What is the official language of France?",
      "options": ["French", "English", "German", "Spanish"],
      "correctAnswer": "French"
    },
    {
      "question": "What is the official currency of the United Kingdom?",
      "options": [
        "British pound",
        "Euro",
        "United States dollar",
        "Canadian dollar"
      ],
      "correctAnswer": "British pound"
    },
    {
      "question":
          "What is the name of the largest river in the world by discharge?",
      "options": ["Amazon River", "Congo River", "Nile River", "Yangtze River"],
      "correctAnswer": "Amazon River"
    },
    {
      "question": "What is the name of the largest desert in the world?",
      "options": [
        "Sahara Desert",
        "Antarctic Desert",
        "Arctic Desert",
        "Gobi Desert"
      ],
      "correctAnswer": "Sahara Desert"
    },
    {
      "question": "What is the name of the tallest building in the world?",
      "options": [
        "Burj Khalifa",
        "Shanghai Tower",
        "Abraj Al Bait Clock Tower",
        "One World Trade Center"
      ],
      "correctAnswer": "Burj Khalifa"
    },
    {
      "question": "What is the capital city of France?",
      "options": ["Berlin", "Madrid", "Paris", "Rome"],
      "correct": "Paris"
    },
    {
      "question": "Which planet is known as the 'Red Planet'?",
      "options": ["Earth", "Mars", "Venus", "Jupiter"],
      "correct": "Mars"
    },
    {
      "question": "What is the largest ocean on Earth?",
      "options": ["Atlantic Ocean", "Indian Ocean", "Arctic Ocean", "Pacific Ocean"],
      "correct": "Pacific Ocean"
    },
    {
      "question": "In which year did the Titanic sink on its maiden voyage?",
      "options": ["1912", "1907", "1923", "1918"],
      "correct": "1912"
    },
    {
      "question": "Who wrote the play 'Romeo and Juliet'?",
      "options": ["Charles Dickens", "William Shakespeare", "Jane Austen", "Mark Twain"],
      "correct": "William Shakespeare"
    },
    {
      "question": "What is the currency of Japan?",
      "options": ["Yuan", "Euro", "Yen", "Dollar"],
      "correct": "Yen"
    },
    {
      "question": "What is the largest mammal in the world?",
      "options": ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus"],
      "correct": "Blue Whale"
    },
    {
      "question": "Which famous scientist developed the theory of general relativity?",
      "options": ["Isaac Newton", "Albert Einstein", "Galileo Galilei", "Stephen Hawking"],
      "correct": "Albert Einstein"
    },
    {
      "question": "What is the longest river in the world?",
      "options": ["Nile", "Amazon", "Yangtze", "Mississippi"],
      "correct": "Amazon"
    },
    {
      "question": "Which country is known as the 'Land of the Rising Sun'?",
      "options": ["China", "Japan", "South Korea", "Vietnam"],
      "correct": "Japan"
    },
    // Add more general knowledge questions as needed...
    {
      "question": "What is the capital city of Australia?",
      "options": ["Sydney", "Melbourne", "Canberra", "Perth"],
      "correct": "Canberra"
    },
    {
      "question": "Which mountain is the highest in the world?",
      "options": ["Mount Kilimanjaro", "Mount McKinley", "Mount Everest", "Mount Fuji"],
      "correct": "Mount Everest"
    },
    {
      "question": "What is the largest desert in the world?",
      "options": ["Sahara Desert", "Arabian Desert", "Gobi Desert", "Antarctica"],
      "correct": "Antarctica"
    },
    {
      "question": "Who is the author of 'To Kill a Mockingbird'?",
      "options": ["J.K. Rowling", "Harper Lee", "George Orwell", "Ernest Hemingway"],
      "correct": "Harper Lee"
    },
    {
      "question": "In which year did the United States declare its independence?",
      "options": ["1776", "1789", "1801", "1812"],
      "correct": "1776"
    },
    {
      "question": "What is the largest continent on Earth?",
      "options": ["Africa", "Asia", "North America", "South America"],
      "correct": "Asia"
    },
    {
      "question": "Which famous scientist developed the laws of motion and universal gravitation?",
      "options": ["Galileo Galilei", "Isaac Newton", "Nikola Tesla", "Marie Curie"],
      "correct": "Isaac Newton"
    },
    {
      "question": "What is the currency of South Africa?",
      "options": ["Rand", "Peso", "Baht", "Euro"],
      "correct": "Rand"
    },
    {
      "question": "Which ocean is the smallest in the world?",
      "options": ["Indian Ocean", "Arctic Ocean", "Atlantic Ocean", "Southern Ocean"],
      "correct": "Arctic Ocean"
    },
    {
      "question": "Who painted the Mona Lisa?",
      "options": ["Vincent van Gogh", "Leonardo da Vinci", "Pablo Picasso", "Michelangelo"],
      "correct": "Leonardo da Vinci"
    },
    {
      "question": "What is the capital city of Brazil?",
      "options": ["Sao Paulo", "Rio de Janeiro", "Brasilia", "Buenos Aires"],
      "correct": "Brasilia"
    },
    // Add more general knowledge questions as needed...
    {
      "question": "Which planet is known as the 'Morning Star'?",
      "options": ["Mars", "Venus", "Jupiter", "Saturn"],
      "correct": "Venus"
    },
    {
      "question": "What is the currency of Japan?",
      "options": ["Yuan", "Euro", "Yen", "Dollar"],
      "correct": "Yen"
    },
    {
      "question": "Which river is the longest in the world?",
      "options": ["Nile", "Amazon", "Yangtze", "Mississippi"],
      "correct": "Amazon"
    },
    {
      "question": "In which year did the Titanic sink on its maiden voyage?",
      "options": ["1912", "1907", "1923", "1918"],
      "correct": "1912"
    },
    {
      "question": "Who wrote the play 'Romeo and Juliet'?",
      "options": ["Charles Dickens", "William Shakespeare", "Jane Austen", "Mark Twain"],
      "correct": "William Shakespeare"
    },
    {
      "question": "What is the capital city of Australia?",
      "options": ["Sydney", "Melbourne", "Canberra", "Perth"],
      "correct": "Canberra"
    },
    {
      "question": "Which mountain is the highest in the world?",
      "options": ["Mount Kilimanjaro", "Mount McKinley", "Mount Everest", "Mount Fuji"],
      "correct": "Mount Everest"
    },
    {
      "question": "What is the largest desert in the world?",
      "options": ["Sahara Desert", "Arabian Desert", "Gobi Desert", "Antarctica"],
      "correct": "Antarctica"
    },
    {
      "question": "Who is the author of 'To Kill a Mockingbird'?",
      "options": ["J.K. Rowling", "Harper Lee", "George Orwell", "Ernest Hemingway"],
      "correct": "Harper Lee"
    },
    {
      "question": "In which year did the United States declare its independence?",
      "options": ["1776", "1789", "1801", "1812"],
      "correct": "1776"
    },
    {
      "question": "What is the largest continent on Earth?",
      "options": ["Africa", "Asia", "North America", "South America"],
      "correct": "Asia"
    },
    // Add more general knowledge questions as needed...
    {
      "question": "What is the capital city of Canada?",
      "options": ["Toronto", "Ottawa", "Vancouver", "Montreal"],
      "correct": "Ottawa"
    },
    {
      "question": "Which country is known as the 'Land of the Rising Sun'?",
      "options": ["China", "Japan", "South Korea", "Vietnam"],
      "correctAnswer": "Japan"
    },
    {
      "question": "What is the currency of South Africa?",
      "options": ["Rand", "Peso", "Baht", "Euro"],
      "correctAnswer": "Rand"
    },
    {
      "question": "Which ocean is the smallest in the world?",
      "options": ["Indian Ocean", "Arctic Ocean", "Atlantic Ocean", "Southern Ocean"],
      "correctAnswer": "Arctic Ocean"
    },
    {
      "question": "Who painted the Mona Lisa?",
      "options": ["Vincent van Gogh", "Leonardo da Vinci", "Pablo Picasso", "Michelangelo"],
      "correctAnswer": "Leonardo da Vinci"
    },
    {
      "question": "What is the capital city of Brazil?",
      "options": ["Sao Paulo", "Rio de Janeiro", "Brasilia", "Buenos Aires"],
      "correctAnswer": "Brasilia"
    },
    {
      "question": "What is the currency of Japan?",
      "options": ["Yuan", "Euro", "Yen", "Dollar"],
      "correctAnswer": "Yen"
    },
    {
      "question": "Which river is the longest in the world?",
      "options": ["Nile", "Amazon", "Yangtze", "Mississippi"],
      "correctAnswer": "Amazon"
    },
    {
      "question": "In which year did the Titanic sink on its maiden voyage?",
      "options": ["1912", "1907", "1923", "1918"],
      "correctAnswer": "1912"
    },
    {
      "question": "Who wrote the play 'Romeo and Juliet'?",
      "options": ["Charles Dickens", "William Shakespeare", "Jane Austen", "Mark Twain"],
      "correctAnswer": "William Shakespeare"
    },
    {
      "question": "What is the capital city of Australia?",
      "options": ["Sydney", "Melbourne", "Canberra", "Perth"],
      "correctAnswer": "Canberra"
    },
    // Add more general knowledge questions as needed...
    {
      "question": "What is the currency of Mexico?",
      "options": ["Peso", "Real", "Dinar", "Dirham"],
      "correctAnswer": "Peso"
    },
    {
      "question": "What is the smallest prime number?",
      "options": ["1", "2", "3", "5"],
      "correctAnswer": "2"
    },
    {
      "question": "Which planet is known as the 'Red Planet'?",
      "options": ["Earth", "Mars", "Venus", "Jupiter"],
      "correctAnswer": "Mars"
    },
    {
      "question": "In which country would you find the Great Barrier Reef?",
      "options": ["Australia", "Brazil", "Mexico", "Indonesia"],
      "correctAnswer": "Australia"
    },
    {
      "question": "Who is the author of the Harry Potter book series?",
      "options": ["J.K. Rowling", "Stephen King", "George R.R. Martin", "Suzanne Collins"],
      "correctAnswer": "J.K. Rowling"
    },
    {
      "question": "What is the largest mammal on Earth?",
      "options": ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus"],
      "correctAnswer": "Blue Whale"
    },
    {
      "question": "Which famous physicist developed the theory of relativity?",
      "options": ["Isaac Newton", "Albert Einstein", "Stephen Hawking", "Niels Bohr"],
      "correctAnswer": "Albert Einstein"
    },
    {
      "question": "What is the capital city of South Korea?",
      "options": ["Seoul", "Tokyo", "Beijing", "Bangkok"],
      "correctAnswer": "Seoul"
    },
    {
      "question": "In which year did the Berlin Wall fall, symbolizing the end of the Cold War?",
      "options": ["1985", "1989", "1991", "1995"],
      "correctAnswer": "1989"
    },
    {
      "question": "Who is the author of '1984'?",
      "options": ["George Orwell", "Aldous Huxley", "Ray Bradbury", "Jules Verne"],
      "correctAnswer": "George Orwell"
    },
    {
      "question": "What is the capital city of Canada?",
      "options": ["Toronto", "Ottawa", "Vancouver", "Montreal"],
      "correctAnswer": "Ottawa"
    },
    // Add more general knowledge questions as needed...
    {
      "question": "Which famous scientist is known for formulating the laws of motion and universal gravitation?",
      "options": ["Isaac Newton", "Albert Einstein", "Galileo Galilei", "Nikola Tesla"],
      "correctAnswer": "Isaac Newton"
    },
    {
      "question": "What is the name of the tallest mountain in the world?",
      "options": ["Mount Everest", "Kilimanjaro", "Mount. Fuji", "Lhotse"],
      "correctAnswer": "Mount Everest"
    },
    {
      "question": "What is the name of the tallest mountain in Africa?",
      "options": ["Mount Everest", "Kilimanjaro", "Kangchenjunga", "Lhotse"],
      "correctAnswer": "Kilimanjaro"
    },
    {
      "question": "What is the name of the largest planet in the solar system?",
      "options": ["Jupiter", "Saturn", "Uranus", "Neptune"],
      "correctAnswer": "Jupiter"
    },
    {
      "question":
          "What is the name of the world's most popular social media platform?",
      "options": ["Facebook", "Instagram", "Twitter", "TikTok"],
      "correctAnswer": "Facebook"
    },
    {
      "question": "What is the name of the world's most popular sport?",
      "options": ["Football", "Basketball", "Cricket", "Tennis"],
      "correctAnswer": "Football"
    },
    {
      "question": "What is the name of the world's most famous painting?",
      "options": [
        "Mona Lisa",
        "Starry Night",
        "The Scream",
        "Girl with a Pearl Earring"
      ],
      "correctAnswer": "Mona Lisa"
    },
    {
      "question": "What is the name of the world's most popular book?",
      "options": [
        "The Bible",
        "Harry Potter",
        "The Lord of the Rings",
        "To Kill a Mockingbird"
      ],
      "correctAnswer": "The Bible"
    },
    {
      "question": "What is the name of the world's most popular movie?",
      "options": [
        "Avatar",
        "Avengers: Endgame",
        "Titanic",
        "Star Wars: The Force Awakens"
      ],
      "correctAnswer": "Avatar"
    },
  ]..shuffle();

  void resetButton() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
    });
  }

  void _answerQuestion(String selectedAnswer) {
    setState(() {
      totalQuestions++;

      if (selectedAnswer == _questions[_currentIndex]['correctAnswer']) {
        _score++;
      }

      if (totalQuestions >= maxAnswered) {
        showQuizDialog();
      } else {
        if (_currentIndex < _questions.length - 1) {
          _currentIndex++;
        } else {
          // Quiz completed, show result or navigate to a new screen
          showQuizDialog();
          // }
        }
      }
    });
  }

  Future<Object?> showQuizDialog() {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        // variable for the failed number of questions and percentage of correct answers
        int failed = 15 - _score;
        int scorePercent = ((_score / 15) * 100).round();

        return Scaffold(
          backgroundColor: Colors.blue,
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.all(60),
              decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 3.0),
              borderRadius: BorderRadius.circular(30), color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/champ.png',
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    width: 250,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3.0),
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '$scorePercent%',
                                  style: const TextStyle(
                                      color: Colors.purpleAccent,
                                      fontSize: 25,
                                      fontFamily: 'Poppins-bold'),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Score Percentage',
                                  style: TextStyle(fontFamily: 'Rowdies'),
                                ),
                              ],
                            ),
                            const Column(
                              children: [
                                Text(
                                  '15',
                                  style: TextStyle(
                                      color: Colors.lightGreen,
                                      fontSize: 25,
                                      fontFamily: 'Poppins-bold'),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Total Questions',
                                  style: TextStyle(fontFamily: 'Rowdies'),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '$_score',
                                  style: const TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontSize: 25,
                                      fontFamily: 'Poppins-bold'),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Correct',
                                  style: TextStyle(fontFamily: 'Rowdies'),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '$failed',
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 25,
                                      fontFamily: 'Poppins-bold'),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Wrong',
                                  style: TextStyle(fontFamily: 'Rowdies'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      resetButton();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SectionScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 3.0,
                      minimumSize: const Size(170, 45),
                      backgroundColor: Colors.blue,
                      // foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontFamily: 'Poppins-Bold'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          // side: const BorderSide(width: 3, color: Colors.blue)
                        )
                      ),
                    child: const Text(
                      "Play Again",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excelsior Quiz App'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.lightBlueAccent,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(value: 0, child: Text('Contact Me')),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                contactButton(context);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SectionScreen())),
                      icon: const Icon(Icons.arrow_back_ios_rounded)),
                ),
                const SizedBox(
                  width: 185,
                ),
                const SizedBox(
                  height: 50,
                  width: 150,
                  child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            'General Knowledge',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )),
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Container(
              height: 250,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 20),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              decoration: BoxDecoration(
                  // color: const Color.fromARGB(255, 131, 212, 249),
                  color: Colors.lightBlueAccent,
                  border: Border.all(color: Colors.blue, width: 3.0),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                _questions[_currentIndex]['question'],
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins-bold',
                ),
              ),
            ),
            Column(
              children: (_questions[_currentIndex]['options'] as List<String>)
                  .map((option) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  child: ElevatedButton(
                    onPressed: () {
                      _answerQuestion(option);
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        minimumSize: const Size(300, 50),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins-Bold'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                                width: 3, color: Colors.blue))),
                    child: Text(option),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }



  // The method for the link to whatsapp feature
  _launchWhatsapp() async {
    var contact = "+2347050250008";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi there";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi there. ')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      EasyLoading.showError('WhatsApp is not installed.');
    }
  }

  // The method for contact button bottom sheet
  Future contactButton(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.web),
                title: const Text('Whatsapp'),
                onTap: () {
                  _launchWhatsapp();
                },
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Gmail'),
                onTap: () async {
                  String? encodeQueryParameters(Map<String, String> params) {
                    params.entries
                        .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                        .join('&');
                    // return null;
                  }

                  final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'soaresayoigbala@gmail.com',
                      query: encodeQueryParameters(
                          <String, String>{'Contact': 'Hi there!'}));

                  // if (await launchUrl(emailLaunchUri)) {
                  //   launchUrl(emailLaunchUri);
                  // } else {
                  //   throw Exception('Could not launch $emailLaunchUri');
                  // }

                  try {
                    await launchUrl(emailLaunchUri);
                  } catch (e) {
                    // print(e.toString());
                  }
                },
              )
            ],
          );
        });
  }
}

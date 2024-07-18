// ignore_for_file: body_might_complete_normally_nullable, avoid_print

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import '../section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FootballScreen extends StatefulWidget {
  const FootballScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FootballScreenState createState() => _FootballScreenState();
}

class _FootballScreenState extends State<FootballScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int totalQuestions = 0;
  int maxAnswered = 15;

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "Which country won the UEFA Euro 2020 tournament?",
      "options": ["Italy", "England", "France", "Spain"],
      "correctAnswer": "Italy"
    },
    {
      "question": "Who is the manager of Manchester City as of 2023?",
      "options": [
        "Jurgen Klopp",
        "Pep Guardiola",
        "Zinedine Zidane",
        "Carlo Ancelotti"
      ],
      "correctAnswer": "Pep Guardiola"
    },
    {
      "question":
          "Which African country has won the most Africa Cup of Nations titles?",
      "options": ["Nigeria", "Cameroon", "Egypt", "Ghana"],
      "correctAnswer": "Egypt"
    },
    {
      "question":
          "In which year did the first FIFA Women's World Cup take place?",
      "options": ["1991", "1985", "2000", "1979"],
      "correctAnswer": "1991"
    },
    {
      "question":
          "Who is the all-time top scorer in the history of the FIFA Women's World Cup?",
      "options": ["Marta", "Abby Wambach", "Birgit Prinz", "Alex Morgan"],
      "correctAnswer": "Marta"
    },
    {
      "question":
          "Which club did Cristiano Ronaldo play for before joining Manchester United in 2021?",
      "options": [
        "Real Madrid",
        "Juventus",
        "Paris Saint-Germain",
        "Barcelona"
      ],
      "correctAnswer": "Juventus"
    },
    {
      "question":
          "Who is the goalkeeper known as the 'Spider-Man' for his incredible saves?",
      "options": [
        "David De Gea",
        "Alisson Becker",
        "Keylor Navas",
        "Thibaut Courtois"
      ],
      "correctAnswer": "Alisson Becker"
    },
    {
      "question":
          "Which player has won the most consecutive FIFA Ballon d'Or awards?",
      "options": [
        "Lionel Messi",
        "Cristiano Ronaldo",
        "Michel Platini",
        "Johan Cruyff"
      ],
      "correctAnswer": "Michel Platini"
    },
    {
      "question":
          "In which country did the first organized soccer game take place?",
      "options": ["England", "Brazil", "Italy", "Germany"],
      "correctAnswer": "England"
    },
    {
      "question": "Who is the youngest player to score in a FIFA World Cup?",
      "options": ["Pele", "Kylian Mbappe", "Michael Owen", "Diego Maradona"],
      "correctAnswer": "Pele"
    },
    {
      "question":
          "Which club won the UEFA Champions League in the 2022-2023 season?",
      "options": ["Chelsea", "Bayern Munich", "Manchester City", "Real Madrid"],
      "correctAnswer": "Real Madrid"
    },
    {
      "question": "Which country won the FIFA World Cup in 2018?",
      "options": ["Brazil", "France", "Germany", "Spain"],
      "correctAnswer": "France"
    },
    {
      "question":
          "Who is the all-time top scorer in the English Premier League?",
      "options": [
        "Thierry Henry",
        "Alan Shearer",
        "Wayne Rooney",
        "Frank Lampard"
      ],
      "correctAnswer": "Alan Shearer"
    },
    {
      "question": "In which year did Pele retire from professional football?",
      "options": ["1970", "1974", "1977", "1980"],
      "correctAnswer": "1977"
    },
    {
      "question": "Which team has won the most UEFA Champions League titles?",
      "options": ["Real Madrid", "Barcelona", "Liverpool", "AC Milan"],
      "correctAnswer": "Real Madrid"
    },
    {
      "question": "Who is known as 'The Special One' in football?",
      "options": [
        "Arsene Wenger",
        "Jose Mourinho",
        "Pep Guardiola",
        "Jurgen Klopp"
      ],
      "correctAnswer": "Jose Mourinho"
    },
    {
      "question": "Which player has the most goals in a single calendar year?",
      "options": [
        "Lionel Messi",
        "Cristiano Ronaldo",
        "Zlatan Ibrahimovic",
        "Neymar"
      ],
      "correctAnswer": "Lionel Messi"
    },
    {
      "question": "In which city is the famous Maracana Stadium located?",
      "options": ["Rio de Janeiro", "Sao Paulo", "Buenos Aires", "Mexico City"],
      "correctAnswer": "Rio de Janeiro"
    },
    {
      "question": "Who won the Golden Boot in the 2018 FIFA World Cup?",
      "options": [
        "Kylian Mbappe",
        "Harry Kane",
        "Luka Modric",
        "Cristiano Ronaldo"
      ],
      "correctAnswer": "Harry Kane"
    },
    {
      "question": "Which player is nicknamed 'CR7'?",
      "options": [
        "Lionel Messi",
        "Cristiano Ronaldo",
        "Neymar",
        "Kylian Mbappe"
      ],
      "correctAnswer": "Cristiano Ronaldo"
    },
    {
      "question": "How many players are there on a standard soccer team?",
      "options": ["10", "11", "12", "9"],
      "correctAnswer": "11"
    },
    {
      "question": "Who is the captain of the Argentina national football team?",
      "options": [
        "Lionel Messi",
        "Sergio Aguero",
        "Paulo Dybala",
        "Gonzalo Higuain"
      ],
      "correctAnswer": "Lionel Messi"
    },
    {
      "question": "Which country hosted the FIFA World Cup in 2014?",
      "options": ["Germany", "Brazil", "Spain", "Russia"],
      "correctAnswer": "Brazil"
    },
    {
      "question":
          "Who is the all-time top scorer for the Brazil national football team?",
      "options": ["Pele", "Ronaldo Nazario", "Romario", "Neymar"],
      "correctAnswer": "Pele"
    },
    {
      "question":
          "Which goalkeeper has the most clean sheets in the history of the English Premier League?",
      "options": [
        "Petr Cech",
        "David De Gea",
        "Edwin van der Sar",
        "Thibaut Courtois"
      ],
      "correctAnswer": "Petr Cech"
    },
    {
      "question": "In which city is the FIFA headquarters located?",
      "options": ["Zurich", "Paris", "London", "New York"],
      "correctAnswer": "Zurich"
    },
    {
      "question":
          "Who won the FIFA Puskas Award in 2022 for the best goal of the year?",
      "options": [
        "Lionel Messi",
        "Mohamed Salah",
        "Erling Haaland",
        "Robert Lewandowski"
      ],
      "correctAnswer": "Mohamed Salah"
    },
    {
      "question": "Which national team is known as the 'Super Eagles'?",
      "options": ["Ghana", "Nigeria", "Cameroon", "Senegal"],
      "correctAnswer": "Nigeria"
    },
    {
      "question":
          "Who is the current captain of the Spanish national football team?",
      "options": [
        "Sergio Ramos",
        "Sergio Busquets",
        "David Silva",
        "Iker Casillas"
      ],
      "correctAnswer": "Sergio Busquets"
    },
    {
      "question": "Which stadium is known as the 'Theatre of Dreams'?",
      "options": ["Old Trafford", "Anfield", "Camp Nou", "Santiago Bernabeu"],
      "correctAnswer": "Old Trafford"
    },
    {
      "question":
          "In which year did the Copa America tournament have joint winners for the first time?",
      "options": ["2015", "2007", "1999", "2023"],
      "correctAnswer": "2015"
    },
    {
      "question":
          "Who holds the record for the most assists in a single Premier League season?",
      "options": [
        "Thierry Henry",
        "Cesc Fabregas",
        "Kevin De Bruyne",
        "Mesut Ozil"
      ],
      "correctAnswer": "Cesc Fabregas"
    },
    {
      "question": "Which country won the UEFA European Championship in 2016?",
      "options": ["France", "Germany", "Portugal", "Spain"],
      "correctAnswer": "Portugal"
    },
    {
      "question":
          "Which player won the Golden Boy award in 2020 for the best young player in Europe?",
      "options": ["Jadon Sancho", "Erling Haaland", "Ansu Fati", "Phil Foden"],
      "correctAnswer": "Erling Haaland"
    },
    {
      "question":
          "In which year did the Video Assistant Referee (VAR) system make its debut in the English Premier League?",
      "options": ["2017", "2018", "2019", "2020"],
      "correctAnswer": "2019"
    },
    {
      "question":
          "Who is the top scorer in the history of the UEFA Champions League?",
      "options": [
        "Lionel Messi",
        "Cristiano Ronaldo",
        "Raul",
        "Robert Lewandowski"
      ],
      "correctAnswer": "Cristiano Ronaldo"
    },
    {
      "question":
          "Which Italian club won the Serie A title in the 2020-2021 season?",
      "options": ["AC Milan", "Inter Milan", "Juventus", "AS Roma"],
      "correctAnswer": "Inter Milan"
    },
    {
      "question":
          "Who is the only player to have won league titles in England, Spain, and Italy?",
      "options": [
        "Zlatan Ibrahimovic",
        "David Beckham",
        "Thierry Henry",
        "Cristiano Ronaldo"
      ],
      "correctAnswer": "Zlatan Ibrahimovic"
    },
    {
      "question": "Which country has won the most FIFA Club World Cup titles?",
      "options": ["Brazil", "Spain", "Germany", "Italy"],
      "correctAnswer": "Brazil"
    },
    {
      "question":
          "In which year did the UEFA Europa Conference League make its debut?",
      "options": ["2020", "2021", "2022", "2023"],
      "correctAnswer": "2021"
    },
    {
      "question":
          "Who is the manager of the Brazil national football team as of 2023?",
      "options": ["Tite", "Dunga", "Felipão", "Carlos Queiroz"],
      "correctAnswer": "Tite"
    },
    {
      "question":
          "Which player holds the record for the fastest hat-trick in the English Premier League?",
      "options": ["Sadio Mane", "Robbie Fowler", "Andy Cole", "Didier Drogba"],
      "correctAnswer": "Sadio Mane"
    },
    {
      "question": "In which city was the first-ever FIFA World Cup held?",
      "options": ["Paris", "Berlin", "Rome", "Montevideo"],
      "correctAnswer": "Montevideo"
    },
    {
      "question": "Who won the Copa Libertadores in 2022?",
      "options": ["Boca Juniors", "Palmeiras", "River Plate", "Flamengo"],
      "correctAnswer": "Palmeiras"
    }
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
                            'Football',
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
                  border: Border.all(color: Colors.white, width: 3.0),
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
                    print(e.toString());
                  }
                },
              )
            ],
          );
        });
  }
}

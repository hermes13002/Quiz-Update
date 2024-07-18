// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import '../section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BibleScreen extends StatefulWidget {
  const BibleScreen({super.key});

  @override
  _BibleScreenState createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int totalQuestions = 0;
  int maxAnswered = 15;

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "What famous city did Nebuchadnezzar rule?",
      "options": ['Nazareth', 'Babylon', 'Israel', 'Jericho'],
      "correctAnswer": "Babylon",
    },
    {
      "question": "Who was Israel’s first high priest?",
      "options": ['Moses', 'Jethro', 'Aaron', 'Joshua'],
      "correctAnswer": "Aaron",
    },
    {
      "question": "Who is the only woman whose age is mentioned in the Bible?",
      "options": ['Keturah', 'Sarah', 'Hannah', 'Esther'],
      "correctAnswer": "Sarah",
    },
    {
      "question":
          "Which books in the Bible are named after women? (____ and ____, in order of appearance in the Bible)",
      "options": [
        'Esther and Deborah',
        'Ruth and Hannah',
        'Ruth and Esther',
        'Deborah and Hannah'
      ],
      "correctAnswer": "Ruth and Esther",
    },
    {
      "question": "How many Jews were exiled to Babylon by Nebuchadnezzar?",
      "options": ['4500', '4600', '4700', '4800'],
      "correctAnswer": '4600',
    },
    {
      "question":
          "When Moses was preparing the Israelites for their coming confrontation with the 7 nations of Canaan, how large an army (number) did he raise?",
      "options": ['603550', '623350', '637380', '68938'],
      "correctAnswer": '603550',
    },
    {
      "question":
          "When God finally let the Israelites enter the promised land of Canaan, how many nations had to be destroyed?",
      "options": ['6', '7', '8', '5'],
      "correctAnswer": '7',
    },
    {
      "question": "Who leapt in his mother’s womb when Mary visited?",
      "options": [
        'Isaiah',
        'Josiah',
        'Matthew the Tax Collector',
        'John the Baptist'
      ],
      "correctAnswer": "John the Baptist",
    },
    {
      "question":
          "After the 5000 ate their fill of the 5 loaves and 2 fishes, how much food was left over?",
      "options": ['12 baskets', '13 baskets', '14 baskets', '10 baskets'],
      "correctAnswer": "12 baskets",
    },
    {
      "question":
          "On the 7th day, how many times did Joshua’s army march around Jericho before the walls fell?",
      "options": ['5', '7', '9', '11'],
      "correctAnswer": '7',
    },
    {
      "question": "Who did God describe as 'a blameless and upright man'?",
      "options": ['Job', 'David', 'Jacob', 'Isaac'],
      "correctAnswer": "Job",
    },
    {
      "question":
          "Aside from the Serpent, what other animal in the Old Testament spoke to humans?",
      "options": ['Horse', 'Dog', 'Cow', 'Donkey'],
      "correctAnswer": "Donkey",
    },
    {
      "question":
          "Whose flock was Moses tending when he encountered the burning bush?",
      "options": ['Miriam', 'Joshua', 'Jethro', 'Ahab'],
      "correctAnswer": "Jethro",
    },
    {
      "question":
          "Who said, 'Silver and gold have I none; but such as I have I give thee'?",
      "options": ['Peter', 'Andrew', 'Matthew', 'Silas'],
      "correctAnswer": "Peter",
    },
    {
      "question": "How long was Jonah in the belly of the great fish?",
      "options": [
        '3 days and 4 nights',
        '2 days and 3 nights',
        '3 days and 3 nights',
        '5 days and 5 nights'
      ],
      "correctAnswer": "3 days and 3 nights",
    },
    {
      "question": "Who is known as the 'father of faith' in the Bible?",
      "options": ["Moses", "Abraham", "David", "Isaac"],
      "answer": "Abraham"
    },
    {
      "question": "What is the first book of the New Testament?",
      "options": ["Genesis", "Exodus", "Matthew", "Acts"],
      "answer": "Matthew"
    },
    {
      "question": "Who was the first king of Israel?",
      "options": ["David", "Saul", "Solomon", "Samuel"],
      "answer": "Saul"
    },
    {
      "question":
          "What miracle did Jesus perform, where he turned water into wine?",
      "options": [
        "Feeding the 5,000",
        "Walking on water",
        "Raising Lazarus",
        "Wedding at Cana"
      ],
      "answer": "Wedding at Cana"
    },
    {
      "question": "Which prophet is known for being swallowed by a large fish?",
      "options": ["Elijah", "Isaiah", "Jonah", "Jeremiah"],
      "answer": "Jonah"
    },
    {
      "question": "Who wrote the majority of the Psalms in the Bible?",
      "options": ["David", "Solomon", "Asaph", "Moses"],
      "answer": "David"
    },
    {
      "question":
          "In which book of the Bible will you find the Ten Commandments?",
      "options": ["Exodus", "Leviticus", "Deuteronomy", "Numbers"],
      "answer": "Exodus"
    },
    {
      "question":
          "Who is known as the 'Good Samaritan' in one of Jesus' parables?",
      "options": ["Peter", "John", "James", "A Samaritan man"],
      "answer": "A Samaritan man"
    },
    {
      "question": "What is the last book of the Bible?",
      "options": ["Revelation", "Daniel", "Malachi", "Hosea"],
      "answer": "Revelation"
    },
    {
      "question": "Which disciple is known as the 'doubting Thomas'?",
      "options": ["Andrew", "Peter", "Thomas", "Philip"],
      "answer": "Thomas"
    },
    {
      "question":
          "In the Old Testament, who led the Israelites across the Jordan River into the Promised Land?",
      "options": ["Moses", "Joshua", "Caleb", "Aaron"],
      "answer": "Joshua"
    },
    {
      "question": "Who is the author of the Book of Acts in the New Testament?",
      "options": ["Paul", "Luke", "John", "Mark"],
      "answer": "Luke"
    },
    {
      "question": "What is the shortest verse in the Bible?",
      "options": [
        "Jesus wept",
        "God is love",
        "For God so loved the world",
        "I am the way, the truth, and the life"
      ],
      "answer": "Jesus wept"
    },
    {
      "question": "Who was the mother of Samuel in the Old Testament?",
      "options": ["Hannah", "Deborah", "Ruth", "Esther"],
      "answer": "Hannah"
    },
    {
      "question": "Which disciple betrayed Jesus for thirty pieces of silver?",
      "options": ["Peter", "James", "Judas Iscariot", "Matthew"],
      "answer": "Judas Iscariot"
    },
    {
      "question":
          "What is the first commandment given to Adam and Eve in the Garden of Eden?",
      "options": [
        "Do not eat from the tree of knowledge",
        "Love your neighbor as yourself",
        "Be fruitful and multiply",
        "You shall have no other gods before me"
      ],
      "answer": "Be fruitful and multiply"
    },
    {
      "question": "Who is known as the 'weeping prophet' in the Old Testament?",
      "options": ["Isaiah", "Jeremiah", "Ezekiel", "Daniel"],
      "answer": "Jeremiah"
    },
    {
      "question": "What is the name of the river in which Jesus was baptized?",
      "options": ["Jordan", "Nile", "Euphrates", "Tigris"],
      "answer": "Jordan"
    },
    {
      "question":
          "Which woman in the Bible is famous for her great beauty and courage?",
      "options": ["Ruth", "Esther", "Mary Magdalene", "Sarah"],
      "answer": "Esther"
    },
    {
      "question":
          "In the New Testament, who was converted on the road to Damascus and became an apostle?",
      "options": ["Paul", "Barnabas", "Timothy", "Silas"],
      "answer": "Paul"
    },
    {
      "question":
          "What is the final book of the Pentateuch, also known as the Torah?",
      "options": ["Genesis", "Exodus", "Leviticus", "Deuteronomy"],
      "answer": "Deuteronomy"
    },
    {
      "question":
          "Who was the father of John the Baptist in the New Testament?",
      "options": ["Zechariah", "Simeon", "Joseph", "Herod"],
      "answer": "Zechariah"
    },
    {
      "question":
          "Which prophet had a vision of a valley of dry bones coming to life?",
      "options": ["Isaiah", "Ezekiel", "Jeremiah", "Daniel"],
      "answer": "Ezekiel"
    },
    {
      "question":
          "Who was the first king of Israel anointed by the prophet Samuel?",
      "options": ["Saul", "David", "Solomon", "Saul's son Jonathan"],
      "answer": "Saul"
    },
    {
      "question":
          "Which disciple of Jesus was a tax collector before becoming an apostle?",
      "options": ["Matthew", "John", "Peter", "Andrew"],
      "answer": "Matthew"
    },
    {
      "question":
          "What is the name of the mountain where Moses received the Ten Commandments?",
      "options": ["Mount Sinai", "Mount Carmel", "Mount Zion", "Mount Hermon"],
      "answer": "Mount Sinai"
    },
    {
      "question":
          "Who is known for being swallowed by a great fish and then being vomited out?",
      "options": ["Jonah", "Daniel", "Elijah", "Job"],
      "answer": "Jonah"
    },
    {
      "question":
          "In the Old Testament, who was sold into slavery by his brothers but later became a powerful leader in Egypt?",
      "options": ["Joseph", "Isaac", "Jacob", "Benjamin"],
      "answer": "Joseph"
    },
    {
      "question":
          "Which woman in the Bible became a judge and led Israel to victory over the Canaanites?",
      "options": ["Ruth", "Deborah", "Esther", "Hannah"],
      "answer": "Deborah"
    },
    {
      "question":
          "Who is traditionally credited with writing most of the Proverbs in the Bible?",
      "options": ["Solomon", "David", "Ezra", "Job"],
      "answer": "Solomon"
    },
    {
      "question":
          "In the New Testament, who was known for his miraculous escape from prison with the help of an angel?",
      "options": ["Paul", "Peter", "John", "James"],
      "answer": "Peter"
    },
    {
      "question":
          "Which Old Testament prophet foretold the birth of Jesus, saying, 'For to us a child is born, to us a son is given'?",
      "options": ["Isaiah", "Jeremiah", "Micah", "Malachi"],
      "answer": "Isaiah"
    },
    {
      "question": "Who was the father of King Solomon in the Old Testament?",
      "options": ["David", "Saul", "Solomon", "Rehoboam"],
      "answer": "David"
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
        int failed = 15 - 1;
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
                            'Bible',
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

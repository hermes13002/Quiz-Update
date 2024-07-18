// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import '../section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class ProgrammingScreen extends StatefulWidget {
  const ProgrammingScreen({super.key});

  @override
  _ProgrammingScreenState createState() => _ProgrammingScreenState();
}

class _ProgrammingScreenState extends State<ProgrammingScreen> {
  int _currentIndex = 0;
  int _score = 0;
  int totalQuestions = 0;
  int maxAnswered = 15;

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "Which programming language is known for its use in artificial intelligence and machine learning?",
      "options": ["Java", "Python", "C++", "Ruby"],
      "correctAnswer": "Python"
    },
    {
      "question": "What does the acronym 'API' stand for in programming?",
      "options": ["Application Programming Interface", "Advanced Programming Interface", "Automated Processing Interface", "Application Processing Interface"],
      "correctAnswer": "Application Programming Interface"
    },
    {
      "question": "In object-oriented programming, what is encapsulation?",
      "options": ["The process of converting code into machine language", "The bundling of data and methods that operate on the data", "A mechanism to control access to class members", "A technique for optimizing code execution"],
      "correctAnswer": "The bundling of data and methods that operate on the data"
    },
    {
      "question": "Which version control system is widely used for tracking changes in source code during software development?",
      "options": ["Git", "SVN", "Mercurial", "Perforce"],
      "correctAnswer": "Git"
    },
    {
      "question": "What does the term 'SQL' stand for in database programming?",
      "options": ["Structured Question Language", "Sequential Query Language", "Standard Query Language", "Structured Query Loop"],
      "correctAnswer": "Structured Query Language"
    },
    {
      "question": "Which programming paradigm promotes the use of mathematical functions and immutable data?",
      "options": ["Procedural programming", "Object-oriented programming", "Functional programming", "Event-driven programming"],
      "correctAnswer": "Functional programming"
    },
    {
      "question": "What is the purpose of the 'try', 'catch', and 'finally' blocks in exception handling?",
      "options": ["To define a loop structure", "To handle runtime errors", "To create multi-threaded applications", "To manage file input/output"],
      "correctAnswer": "To handle runtime errors"
    },
    {
      "question": "Which programming language was developed by Microsoft and is commonly used for Windows application development?",
      "options": ["Java", "C#", "Python", "Ruby"],
      "correctAnswer": "C#"
    },
    {
      "question": "What is the term for a piece of code that can be executed independently and is often used to perform a specific task?",
      "options": ["Snippet", "Algorithm", "Function", "Module"],
      "correctAnswer": "Function"
    },
    {
      "question": "In web development, what does CSS stand for?",
      "options": ["Computer Style Sheets", "Cascading Style Sheets", "Creative Style Sheets", "Colorful Style Sheets"],
      "correctAnswer": "Cascading Style Sheets"
    },
    {
      "question": "Which design pattern is used to ensure a class has only one instance and provides a global point of access to it?",
      "options": ["Observer", "Singleton", "Decorator", "Factory"],
      "correctAnswer": "Singleton"
    },
    {
      "question": "What does the acronym 'HTTP' stand for?",
      "options": ["Hypertext Transfer Protocol", "High-Level Transfer Protocol", "Hyperlink and Text Transfer Protocol", "Hypertext Type Transfer Protocol"],
      "correctAnswer": "Hypertext Transfer Protocol"
    },
    {
      "question": "Which programming language is often used for building interactive and dynamic web pages?",
      "options": ["Java", "C#", "JavaScript", "PHP"],
      "correctAnswer": "JavaScript"
    },
    {
      "question": "In Python, what is the purpose of the 'lambda' function?",
      "options": ["To define a class", "To create anonymous functions", "To implement multithreading", "To perform file I/O operations"],
      "correctAnswer": "To create anonymous functions"
    },
    {
      "question": "What is the primary purpose of the 'DOCTYPE' declaration in HTML?",
      "options": ["To define document type", "To declare a variable", "To specify a font type", "To create a hyperlink"],
      "correctAnswer": "To define document type"
    },
    {
      "question": "Which sorting algorithm has an average-case time complexity of O(n log n)?",
      "options": ["Bubble Sort", "Quick Sort", "Insertion Sort", "Selection Sort"],
      "correctAnswer": "Quick Sort"
    },
    {
      "question": "What is the purpose of the 'this' keyword in JavaScript?",
      "options": ["Refers to the current HTML document", "Refers to the previous function", "Refers to the global object", "Refers to the current object"],
      "correctAnswer": "Refers to the current object"
    },
    {
      "question": "Which data structure follows the Last In, First Out (LIFO) principle?",
      "options": ["Queue", "Linked List", "Stack", "Tree"],
      "correctAnswer": "Stack"
    },
    {
      "question": "What is the purpose of the 'git clone' command in Git?",
      "options": ["Create a new branch", "Push changes to a remote repository", "Clone a repository into a new directory", "Undo the last commit"],
      "correctAnswer": "Clone a repository into a new directory"
    },
    {
      "question": "In object-oriented programming, what is polymorphism?",
      "options": ["The ability to inherit multiple classes", "The ability of a function to operate on different types", "The process of encapsulating data and methods", "The practice of creating private methods"],
      "correctAnswer": "The ability of a function to operate on different types"
    },
    {
      "question": "What is the purpose of the 'npm' command in Node.js?",
      "options": ["Node Package Manager", "New Project Module", "Node Process Manager", "Node Project Manager"],
      "correctAnswer": "Node Package Manager"
    },
    {
      "question": "Which programming language is often used for data analysis and statistical computing?",
      "options": ["Java", "Python", "R", "Scala"],
      "correctAnswer": "R"
    },
    {
      "question": "What is the purpose of the 'finally' block in a try-catch-finally statement?",
      "options": ["To define the main program logic", "To handle exceptions", "To specify code that always executes", "To break out of a loop"],
      "correctAnswer": "To specify code that always executes"
    },
    {
      "question": "Which programming paradigm is based on the concept of 'objects'?",
      "options": ["Procedural programming", "Object-oriented programming", "Functional programming", "Imperative programming"],
      "correctAnswer": "Object-oriented programming"
    },
    {
      "question": "What is the key advantage of using a RESTful API in web development?",
      "options": ["Enables asynchronous communication", "Supports SOAP protocol", "Facilitates stateful communication", "Promotes scalable and stateless communication"],
      "correctAnswer": "Promotes scalable and stateless communication"
    },
    {
      "question": "In Python, what does the 'virtualenv' tool help with?",
      "options": ["Code versioning", "Dependency management", "Virtual machine creation", "Environment isolation"],
      "correctAnswer": "Environment isolation"
    },
    {
      "question": "Which design pattern is used to define a family of algorithms, encapsulate each one, and make them interchangeable?",
      "options": ["Singleton", "Strategy", "Observer", "Decorator"],
      "correctAnswer": "Strategy"
    },
    {
      "question": "What is the purpose of the 'break' statement in a loop?",
      "options": ["Terminate the loop and resume with the next iteration", "Exit the entire program", "Skip the current iteration and continue with the next", "Pause the loop for a specified time"],
      "correctAnswer": "Terminate the loop and resume with the next iteration"
    },
    {
      "question": "What is the primary use of the 'npm init' command in Node.js?",
      "options": ["Install new packages", "Initialize a new Node.js project", "Run tests", "Update existing packages"],
      "correctAnswer": "Initialize a new Node.js project"
    },
    {
      "question": "Which sorting algorithm has the best average and worst-case time complexity of O(n log n)?",
      "options": ["Bubble Sort", "Merge Sort", "Insertion Sort", "Selection Sort"],
      "correctAnswer": "Merge Sort"
    },
    {
      "question": "In JavaScript, what is the purpose of the 'typeof' operator?",
      "options": ["Check if a variable is defined", "Determine the data type of a variable", "Concatenate strings", "Assign a variable"],
      "correctAnswer": "Determine the data type of a variable"
    },
    {
      "question": "What is the primary function of the 'docker-compose' tool in containerization?",
      "options": ["Build Docker images", "Run multiple Docker containers as a service", "Manage Docker volumes", "Monitor Docker networks"],
      "correctAnswer": "Run multiple Docker containers as a service"
    },
    {
      "question": "Which programming language is often used for building mobile applications?",
      "options": ["Swift", "Java", "Kotlin", "Objective-C"],
      "correctAnswer": "Swift"
    },
    {
      "question": "What is the purpose of the 'git merge' command in version control?",
      "options": ["Create a new branch", "Merge changes from one branch into another", "Undo the last commit", "View commit history"],
      "correctAnswer": "Merge changes from one branch into another"
    },
    {
      "question": "In Java, what is the difference between '== 'and '.equals()' when comparing strings?",
      "options": ["No difference, they are interchangeable", "'==' compares object references, '.equals()' compares content", "'==' compares content, '.equals()' compares object references", "'==' is used for numerical comparison, '.equals()' for string comparison"],
      "correctAnswer": "'==' compares object references, '.equals()' compares content"
    },
    {
      "question": "What is the purpose of the 'npm install' command in Node.js?",
      "options": ["Uninstall a package", "Install a new package", "Update all packages", "Initialize a new Node.js project"],
      "correctAnswer": "Install a new package"
    },
    {
      "question": "What is the significance of the '404' HTTP status code?",
      "options": ["Successful response", "Client error - not found", "Server error", "Redirect"],
      "correctAnswer": "Client error - not found"
    },
    {
      "question": "In Python, what is the purpose of the 'map' function?",
      "options": ["Create a new list with the results of applying a function to each item", "Remove elements from a list", "Sort a list in ascending order", "Concatenate two lists"],
      "correctAnswer": "Create a new list with the results of applying a function to each item"
    },
    {
      "question": "What is the primary use of the 'docker run' command in containerization?",
      "options": ["Build a Docker image", "List all running containers", "Run a Docker container based on an image", "Stop a running container"],
      "correctAnswer": "Run a Docker container based on an image"
    },
    {
      "question": "In programming, what does the term 'agile' refer to?",
      "options": ["A type of bug in software", "A project management methodology", "A programming language", "A type of database"],
      "correctAnswer": "A project management methodology"
    },
    {
      "question": "Which data structure is often used to implement a LIFO (Last In, First Out) structure?",
      "options": ["Queue", "Linked List", "Heap", "Stack"],
      "correctAnswer": "Stack"
    },
    {
      "question": "What is the purpose of the 'NaN' value in JavaScript?",
      "options": ["Represents 'Not a Number'", "Denotes a negative value", "Indicates an empty variable", "Stands for 'Null and Noteworthy'"],
      "correctAnswer": "Represents 'Not a Number'"
    },
    {
      "question": "In the context of databases, what does 'ACID' stand for?",
      "options": ["Atomicity, Consistency, Isolation, Durability", "Associative, Commutative, Idempotent, Distributive", "Algorithm, Complexity, Iteration, Data", "Asynchronous, Concurrency, Incremental, Database"],
      "correctAnswer": "Atomicity, Consistency, Isolation, Durability"
    },
    {
      "question": "Which programming language is often used for developing web servers?",
      "options": ["Python", "JavaScript", "Ruby", "Go"],
      "correctAnswer": "Go"
    }, 
    {
      "question": "What is the purpose of the 'async' and 'await' keywords in JavaScript?",
      "options": ["Synchronize code execution", "Define asynchronous functions", "Create anonymous functions", "Handle errors in try-catch blocks"],
      "correctAnswer": "Define asynchronous functions"
    },
    {
      "question": "What is the primary use of the 'for...of' loop in JavaScript?",
      "options": ["Iterating over the properties of an object", "Iterating over the elements of an array", "Defining a recursive loop", "Creating a conditional loop"],
      "correctAnswer": "Iterating over the elements of an array"
    },
    {
      "question": "In the context of databases, what is a 'foreign key'?",
      "options": ["A key used for encryption", "A key that uniquely identifies a record", "A key that links two tables together", "A key for sorting records"],
      "correctAnswer": "A key that links two tables together"
    },
    {
      "question": "What is the purpose of the 'chmod' command in Unix-based operating systems?",
      "options": ["Change file ownership", "Change file permissions", "Create a new directory", "Copy files between directories"],
      "correctAnswer": "Change file permissions"
    },
    {
      "question": "Which design pattern is used to ensure that a class has only one instance and provides a global point of access to it?",
      "options": ["Observer", "Singleton", "Decorator", "Factory"],
      "correctAnswer": "Singleton"
    },
    {
      "question": "What does the term 'scalability' mean in the context of software development?",
      "options": ["The ability to add new features easily", "The ability to handle a growing number of users or requests", "The efficiency of algorithms", "The security of a system"],
      "correctAnswer": "The ability to handle a growing number of users or requests"
    },
    {
      "question": "Which programming language is often associated with the development of mobile applications for iOS?",
      "options": ["Swift", "Java", "Kotlin", "Objective-C"],
      "correctAnswer": "Swift"
    },
    {
      "question": "What is the purpose of the 'git pull' command in version control?",
      "options": ["Push changes to a remote repository", "Merge changes from a remote repository", "Fetch and merge changes from a remote repository", "View commit history"],
      "correctAnswer": "Fetch and merge changes from a remote repository"
    },
    {
      "question": "In Python, what is the purpose of the 'yield' keyword in a function?",
      "options": ["Pause the execution and return a value", "Terminate the function", "Create a generator function", "Define a recursive function"],
      "correctAnswer": "Pause the execution and return a value"
    },
    {
      "question": "Which data structure is suitable for implementing a priority queue?",
      "options": ["Queue", "Stack", "Heap", "Linked List"],
      "correctAnswer": "Heap"
    },
    {
      "question": "What is the primary purpose of the 'npm update' command in Node.js?",
      "options": ["Update all packages to their latest versions", "Install a new package", "Uninstall a package", "Initialize a new Node.js project"],
      "correctAnswer": "Update all packages to their latest versions"
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

        return 
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
                            'Programming',
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
                    // print(e.toString());
                  }
                },
              )
            ],
          );
        });
  }


}



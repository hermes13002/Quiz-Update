import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:quiz/screens/loading_screen.dart';
import 'package:quiz/screens/section_screens/bible.dart';
import 'package:quiz/screens/section_screens/general.dart';
import 'package:quiz/screens/section_screens/history.dart';
import 'package:quiz/screens/section_screens/programming.dart';
import 'section_screens/football.dart';

class SectionScreen extends StatefulWidget {
  const SectionScreen({super.key});

  @override
  State<SectionScreen> createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        color: const Color.fromARGB(255, 39, 39, 39),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics:  const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Gap(55),
              Text('Category', style: TextStyle(fontSize: 27.sp, fontFamily: 'Poppins-Bold', color: Colors.white,),)
              .animate(onPlay: (controller) => controller.repeat())
              .shimmer(duration: 1200.ms, color: Colors.lightBlueAccent),
          
              const Gap(25),
              Text('Choose Your Preferred Quiz', style: TextStyle(fontSize: 20.sp, fontFamily: 'Poppins',fontWeight: FontWeight.w100, color: Colors.white60),),
              
              const Gap(5),
              GridView(
                shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                children: [
                  sectionTypeContainer(
                    const GeneralScreen(), Icons.public, 'General Knowledge'
                  ).animate().scale(duration: 500.ms, curve: Curves.elasticInOut),
          
                  sectionTypeContainer(
                    const ProgrammingScreen(), Icons.laptop_chromebook, 'Programming'
                  ).animate().then(delay: 120.ms).scale(duration: 500.ms, curve: Curves.elasticInOut),
          
                  sectionTypeContainer(
                    const BibleScreen(), Icons.menu_book, 'Bible'
                  ).animate().then(delay: 140.ms).scale(duration: 500.ms, curve: Curves.elasticInOut),
          
                  sectionTypeContainer(
                    const FootballScreen(), Icons.sports_soccer, 'Football'
                  ).animate().then(delay: 160.ms).scale(duration: 500.ms, curve: Curves.elasticInOut),

                  sectionTypeContainer(
                    const HistoryScreen(), Icons.history_edu, 'History'
                  ).animate().then(delay: 180.ms).scale(duration: 500.ms, curve: Curves.elasticInOut),
          
                  for (int i = 0; i < 7; i++)
                  sectionTypeContainer(
                    const SizedBox(), Icons.quiz_outlined, 'Coming soon'
                  ).animate().then(delay: 200.ms).scale(duration: 500.ms, curve: Curves.elasticInOut),
                ],
              ),
              const Gap(10),
            ],
          ),
        ),
    ));
  }


  Widget sectionTypeContainer(Widget screenName, IconData icon, String text) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoadingScreen(quizScreen: screenName,)));
      },
      child: Card(
        elevation: 0,
        color: const Color.fromARGB(255, 49, 49, 49),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [
                Icon(icon, color: Colors.lightBlueAccent,),
                
                Text(text, textAlign: TextAlign.center, style: TextStyle(color: Colors.lightBlueAccent, fontSize: 15.sp, fontFamily: 'Poppins-Bold',),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

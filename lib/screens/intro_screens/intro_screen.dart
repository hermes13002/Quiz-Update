import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/screens/category_screen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: "Let's Go",
      onFinish: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SectionScreen()));
      },
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: Colors.lightBlueAccent,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100.0))),
      ),
      skipTextButton: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SectionScreen()));
        },
        child: Text(
          'Skip',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600, fontFamily: 'Poppins'
          ),
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SectionScreen()));
        },
        child: Text(
          "Let's Go",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600, fontFamily: 'Poppins'
          ),
        ),
      ),
      trailingFunction: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SectionScreen()));
      },
      centerBackground: true,
      controllerColor: Colors.lightBlueAccent,
      totalPage: 2,
      headerBackgroundColor: const Color.fromARGB(255, 39, 39, 39),
      pageBackgroundColor: const Color.fromARGB(255, 39, 39, 39),
      background: [
        Lottie.asset(
          'assets/lottie/anim1.json',
          animate: true,
          repeat: true
        ),
        Lottie.asset(
          'assets/lottie/anim2.json',
          animate: true,
          repeat: true
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Gap.expand(500),
              Text(
                'Welcome to Quiz-ter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w600, fontFamily: 'Poppins-Bold',
                ),
              ).animate(onPlay: (controller) => controller.repeat())
              .shimmer(duration: 1200.ms, color: const Color.fromARGB(255, 0, 103, 151)),
              
              const Gap(20),
              
              Text(
                'Where knowledge meets fun and an ultimate quiz experience, tailored just for you!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0.sp,
                  fontWeight: FontWeight.w400, fontFamily: 'Rowdies',
                ),
              ),
            ],
          ),
        ),
        
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Gap.expand(500),
              Text(
                'Quiz-ter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w600, fontFamily: 'Poppins-Bold',
                ),
              ).animate(onPlay: (controller) => controller.repeat())
              .shimmer(duration: 1200.ms, color: const Color.fromARGB(255, 0, 103, 151)),

              const Gap(20),
              
              Text(
                'Unleash your inner genius—start your quiz journey now!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0.sp,
                  fontWeight: FontWeight.w400, fontFamily: 'Rowdies',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

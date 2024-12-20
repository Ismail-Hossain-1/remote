import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:remote/main.dart'; // Import MyApp

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset("assets/lottie/Animation - 1734378458939.json"),
          ),
        ],
      ),
     // nextScreen: const MyHomePage(title: 'Flutter Demo Home Page'), // Navigate to MyHomePage
      splashIconSize: 400,
      backgroundColor: Color.fromARGB(255, 107, 159, 248),
      // duration: 3000,
    );
  }
}

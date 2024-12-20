import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:remote/content_model.dart';
import 'package:remote/signup.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: 3,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                SvgPicture.asset(
                  contents[i].image,
                  height: 250,
                ),
                const SizedBox(height: 100),
                Text(
                  contents[i].title,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFC734904),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  contents[i].description,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFC867960)),
                ),
                const SizedBox(height: 20),
                // Use SmoothPageIndicator instead of the custom buildDot method
                SmoothPageIndicator(
                  controller: _controller,
                  count: contents.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Color(0xFC867960),
                    dotColor: Colors.grey,
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 8,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 50,
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: TextButton(
                    child: Text(
                      currentIndex == contents.length - 1 ? "Continue" : "Get Started!",
                    ),
                    onPressed: () {
                      if (currentIndex == contents.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SignUp(),
                          ),
                        );
                      }
                      _controller.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFC867960),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

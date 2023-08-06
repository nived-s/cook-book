import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utilities/constants.dart';

// pages
import 'package:cook_book/screens/home_screen.dart';
import 'package:cook_book/screens/onBoarding/screen1.dart';
import 'package:cook_book/screens/onBoarding/screen2.dart';
import 'package:cook_book/screens/onBoarding/screen3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // controller to keep track of which page user on
  final PageController _controller = PageController();

  // last page reached or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // scrolling pages
            PageView(
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              controller: _controller,
              children: [
                OnBoarding1(),
                OnBoarding1(),
                OnBoarding1(),
              ],
            ),
            // smooth page indicator
            Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // skip button
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      'Skip',
                      style: kOnboadingSkipBtn,
                    ),
                  ),
                  // page indicator
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const SwapEffect(
                      dotColor: kSecondaryColour,
                      activeDotColor: kTeritiaryColour,
                    ),
                  ),
                  // next or done btn
                  onLastPage
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kTeritiaryColour,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ));
                              },
                              child: Text(
                                'Done',
                                style: kOnboadingNextDoneBtn,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kTeritiaryColour,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                _controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInSine);
                              },
                              child: Text(
                                'Next',
                                style: kOnboadingNextDoneBtn,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

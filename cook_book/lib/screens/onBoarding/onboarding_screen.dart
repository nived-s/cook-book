import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utilities/constants.dart';

// pages
import 'package:cook_book/screens/home_screen.dart';
import 'package:cook_book/screens/onBoarding/onBoardingWidget.dart';

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
            Container(
              padding: const EdgeInsets.only(bottom: 80),
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    onLastPage = (index == 2);
                  });
                },
                controller: _controller,
                children: const [
                  OnBoarding(
                    gradRotation: 0.4,
                    image: 'images/onboard5.png',
                    headingText: 'Welcome to CookBook',
                    descriptionText:
                        'Experience the joy of cooking through a seamless blend of written recipes and engaging video guides.',
                  ),
                  OnBoarding(
                    gradRotation: -0.4,
                    image: 'images/onboard6.png',
                    headingText: 'Discover a World of Flavors',
                    descriptionText:
                        'From traditional favorites to innovative twists, there\'s a recipe for every craving.Explore global cuisines and uncover the secrets of diverse flavors and ingredients.',
                  ),
                  OnBoarding(
                    gradRotation: 0.4,
                    image: 'images/onboard7.png',
                    headingText: 'Create, Cook, and Share',
                    descriptionText:
                        'Join a community that celebrates the joy of cooking and sharing.Elevate your recipes with captivating video guides.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // smooth page indicator
      bottomSheet: SizedBox(
        height: 80,
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
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool('showHome', true);
                          // ignore: use_build_context_synchronously
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
    );
  }
}

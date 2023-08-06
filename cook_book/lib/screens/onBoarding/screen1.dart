import 'package:flutter/material.dart';
import 'package:cook_book/utilities/constants.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.yellow, Colors.white],
              stops: [0.1, 0.5],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              transform: GradientRotation((22 / 7) / 8)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              // image
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Image.asset(
                  'images/onboard5.png',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // heading
              Text(
                'Welcome to CookBook',
                style: kOnboardingHeadingText,
              ),
              const SizedBox(
                height: 10,
              ),
              // description
              Text(
                'Experience the joy of cooking through a seamless blend of written recipes and engaging video guides. Whether you\'re a seasoned chef or an aspiring home cook, FoodieVerse caters to your preferences. Embark on a gastronomic journey that brings together the richness of tradition and the thrill of experimentation.',
                style: kOnboardingDescriptionText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

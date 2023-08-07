import 'package:flutter/material.dart';
import 'package:cook_book/utilities/constants.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key, required this.gradRotation, required this.image, required this.headingText, required this.descriptionText});

  final double gradRotation;
  final String image;
  final String headingText;
  final String descriptionText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [Colors.yellow, Colors.white],
            stops: const [0.1, 0.5],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            transform: GradientRotation(gradRotation),
          ),
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
                  image,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // heading
              Text(
                headingText,
                style: kOnboardingHeadingText,
              ),
              const SizedBox(
                height: 10,
              ),
              // description
              Text(
                descriptionText,
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
